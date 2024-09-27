import { ApiProperty } from '@nestjs/swagger';

export class CreateTableDto {
  @ApiProperty({
    description: 'Name of the table to create',
    example: 'BuildingA3',
  })
  tableName: string;
}