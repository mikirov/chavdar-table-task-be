import {
  Injectable,
  UnauthorizedException,
  BadRequestException,
} from '@nestjs/common';
import { DataSource } from 'typeorm';
import { User } from '../users/entities/user.entity';
import { UsersService } from '../users/users.service';
import { InjectDataSource } from '@nestjs/typeorm';

@Injectable()
export class TablesService {
  constructor(
    @InjectDataSource()
    private readonly dataSource: DataSource,
    private readonly usersService: UsersService,
  ) {}

  // Get all tables the user is allowed to see
  async getUserTables(user: User): Promise<string[]> {
    return user.accessibleTables;
  }

  // Create a new table
  async createTable(user: User, tableName: string): Promise<void> {
    // Validate table name
    if (!this.isValidTableName(tableName)) {
      throw new BadRequestException('Invalid table name');
    }

    // Check if table already exists
    const tableExists = await this.tableExists(tableName);
    if (tableExists) {
      throw new BadRequestException(`Table ${tableName} already exists`);
    }

    // Create the table
    const query = `
      CREATE TABLE \`${tableName}\` (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255),
        family VARCHAR(255),
        cardno VARCHAR(255),
        groupid VARCHAR(255),
        email VARCHAR(255),
        company VARCHAR(255),
        regdate DATE,
        pic VARCHAR(255),
        active BOOLEAN,
        comment TEXT,
        usr VARCHAR(255),
        psw VARCHAR(255)
      );
    `;
    await this.dataSource.query(query);

    // Update user's accessibleTables
    user.accessibleTables.push(tableName);
    await this.usersService.updateAccessibleTables(
      user.id,
      user.accessibleTables,
    );
  }

  // Delete a table
  async deleteTable(user: User, tableName: string): Promise<void> {
    // Validate table name
    if (!this.isValidTableName(tableName)) {
      throw new BadRequestException('Invalid table name');
    }

    // Check if user has permission to delete this table
    if (!user.accessibleTables.includes(tableName)) {
      throw new UnauthorizedException(
        'You do not have permission to delete this table',
      );
    }

    // Check if table exists
    const tableExists = await this.tableExists(tableName);
    if (!tableExists) {
      throw new BadRequestException(`Table ${tableName} does not exist`);
    }

    // Drop the table
    const query = `DROP TABLE \`${tableName}\`;`;
    await this.dataSource.query(query);

    // Remove the table from all users' accessibleTables
    await this.usersService.removeTableFromAllUsers(tableName);
  }

  // Helper method to check if a table exists
  private async tableExists(tableName: string): Promise<boolean> {
    const result = await this.dataSource.query(`SHOW TABLES LIKE ?`, [
      tableName,
    ]);
    return result.length > 0;
  }

  // Validate table names to prevent SQL injection
  private isValidTableName(tableName: string): boolean {
    return /^[a-zA-Z0-9_]+$/.test(tableName);
  }
}
