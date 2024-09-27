import { IsString, IsArray, ArrayNotEmpty } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateUserDto {
  @ApiProperty({ description: 'Unique username for the user' })
  @IsString()
  username: string;

  @ApiProperty({ description: 'Password for the user' })
  @IsString()
  password: string;

  @ApiProperty({
    description: 'List of tables the user can access',
    type: [String],
  })
  @IsArray()
  @ArrayNotEmpty()
  accessibleTables: string[];
}
