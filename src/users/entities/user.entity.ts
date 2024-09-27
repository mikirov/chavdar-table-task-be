import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';

@Entity('users')
export class User {
  @ApiProperty({ description: 'User ID' })
  @PrimaryGeneratedColumn()
  id: number;

  @ApiProperty({ description: 'Unique username' })
  @Column({ unique: true })
  username: string;

  @ApiProperty({ description: 'Hashed password', writeOnly: true })
  @Column()
  password: string;

  @ApiProperty({ description: 'Accessible tables', type: [String] })
  @Column('simple-array')
  accessibleTables: string[];
}
