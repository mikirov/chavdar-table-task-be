import {
  Injectable,
  UnauthorizedException,
  BadRequestException,
  InternalServerErrorException,
} from '@nestjs/common';
import { DataSource } from 'typeorm';
import { User } from '../users/entities/user.entity';

@Injectable()
export class BuildingsService {
  constructor(private readonly dataSource: DataSource) {}

  // Validate table names to prevent SQL injection and unauthorized access
  private validateTableName(user: User, tableName: string): string {
    const validTableNames = user.accessibleTables.map((name) =>
      name.toLowerCase(),
    );
    const lowerTableName = tableName.toLowerCase();

    if (!validTableNames.includes(lowerTableName)) {
      throw new UnauthorizedException('Access to this table is denied');
    }

    // Escape the table name to prevent SQL injection
    return '`' + lowerTableName.replace(/`/g, '``') + '`';
  }

  // Fetch all records from any table
  async findAll(user: User, tableName: string): Promise<any[]> {
    const escapedTableName = this.validateTableName(user, tableName);
    const query = `SELECT * FROM ${escapedTableName}`;
    return this.dataSource.query(query);
  }

  // Create a new record in any table
  async create(user: User, tableName: string, createData: any): Promise<any> {
    const escapedTableName = this.validateTableName(user, tableName);

    const columns = Object.keys(createData);
    if (columns.length === 0) {
      throw new BadRequestException('No data provided to create');
    }

    const placeholders = columns.map(() => '?').join(', ');
    const values = columns.map((col) => createData[col]);
    const escapedColumns = columns
      .map((col) => '`' + col.replace(/`/g, '``') + '`')
      .join(', ');

    const query = `INSERT INTO ${escapedTableName} (${escapedColumns}) VALUES (${placeholders})`;

    try {
      const result = await this.dataSource.query(query, values);
      console.log(result, 'wow');

      const newId = result.insertId || result[0]?.insertId;
      if (!newId) {
        throw new Error('Failed to retrieve new ID after insert');
      }

      const selectQuery = `SELECT * FROM ${escapedTableName} WHERE id = ${newId}`;
      const records = await this.dataSource.query(selectQuery, [newId]);
      return records[0];
    } catch (error) {
      console.error('Error during create operation:', error);
      throw new InternalServerErrorException('Error creating record');
    }
  }

  // Update a record in any table
  async update(
    user: User,
    tableName: string,
    id: number,
    updateData: any,
  ): Promise<any> {
    const escapedTableName = this.validateTableName(user, tableName);

    if (!id) {
      throw new BadRequestException('ID is required');
    }

    const columns = Object.keys(updateData);
    if (columns.length === 0) {
      throw new BadRequestException('No data provided to update');
    }

    const setClause = columns
      .map((col) => `\`${col.replace(/`/g, '``')}\` = ?`)
      .join(', ');
    const values = columns.map((col) => updateData[col]);

    const query = `UPDATE ${escapedTableName} SET ${setClause} WHERE id = ${id}`;
    await this.dataSource.query(query, [...values, id]);

    // Return the updated record
    const selectQuery = `SELECT * FROM ${escapedTableName} WHERE id = ${id}`;
    const results = await this.dataSource.query(selectQuery, [id]);
    return results[0];
  }

  // Delete a record from any table
  async remove(user: User, tableName: string, id: number): Promise<void> {
    const escapedTableName = this.validateTableName(user, tableName);

    if (!id) {
      throw new BadRequestException('ID is required');
    }

    const query = `DELETE FROM ${escapedTableName} WHERE id = ${id}`;
    await this.dataSource.query(query, [id]);
  }
}
