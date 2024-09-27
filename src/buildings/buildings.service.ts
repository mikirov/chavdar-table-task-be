import {
  Injectable,
  UnauthorizedException,
  BadRequestException,
} from '@nestjs/common';
import { DataSource } from 'typeorm';
import { User } from '../users/entities/user.entity';

@Injectable()
export class BuildingsService {
  constructor(private readonly dataSource: DataSource) {}

  // Validate table names to prevent SQL injection
  private validateTableName(user: User, tableName: string): string {
    const validTableNames = user.accessibleTables.map((name) =>
      name.toLowerCase(),
    );
    const lowerTableName = tableName.toLowerCase();

    if (!validTableNames.includes(lowerTableName)) {
      throw new UnauthorizedException('Access to this table is denied');
    }

    // Additional server-side validation can be added here, e.g., checking against a list of known table names
    return lowerTableName;
  }

  // Fetch all records from a building table
  async findAll(user: User, tableName: string): Promise<any[]> {
    tableName = this.validateTableName(user, tableName);

    // Use backticks to escape the table name
    const query = `SELECT * FROM \`${tableName}\``;
    return this.dataSource.query(query);
  }

  // Update a record in a building table
  async update(
    user: User,
    tableName: string,
    id: number,
    updateData: any,
  ): Promise<any> {
    tableName = this.validateTableName(user, tableName);

    if (!id) {
      throw new BadRequestException('ID is required');
    }

    const columns = Object.keys(updateData);
    if (columns.length === 0) {
      throw new BadRequestException('No data provided to update');
    }

    const setClause = columns.map((col) => `\`${col}\` = ?`).join(', ');
    const values = columns.map((col) => updateData[col]);

    const query = `UPDATE \`${tableName}\` SET ${setClause} WHERE id = ?`;
    await this.dataSource.query(query, [...values, id]);

    // Return the updated record
    const selectQuery = `SELECT * FROM \`${tableName}\` WHERE id = ?`;
    const results = await this.dataSource.query(selectQuery, [id]);
    return results[0];
  }

  // Create a new record in a building table
  async create(user: User, tableName: string, createData: any): Promise<any> {
    tableName = this.validateTableName(user, tableName);

    const columns = Object.keys(createData);
    if (columns.length === 0) {
      throw new BadRequestException('No data provided to create');
    }

    const placeholders = columns.map(() => '?').join(', ');
    const values = columns.map((col) => createData[col]);

    const query = `INSERT INTO \`${tableName}\` (\`${columns.join(
      '`, `',
    )}\`) VALUES (${placeholders})`;
    const result = await this.dataSource.query(query, values);

    const newId = result.insertId;

    // Return the newly created record
    const selectQuery = `SELECT * FROM \`${tableName}\` WHERE id = ?`;
    const records = await this.dataSource.query(selectQuery, [newId]);
    return records[0];
  }

  // Delete a record
  async remove(user: User, tableName: string, id: number): Promise<void> {
    tableName = this.validateTableName(user, tableName);

    if (!id) {
      throw new BadRequestException('ID is required');
    }

    const query = `DELETE FROM \`${tableName}\` WHERE id = ?`;
    await this.dataSource.query(query, [id]);
  }
}
