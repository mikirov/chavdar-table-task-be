// building.dto.ts
import { ApiProperty } from '@nestjs/swagger';

export class BuildingDto {
  @ApiProperty({ description: 'ID of the record' })
  id: number;

  @ApiProperty({ description: 'Name of the person' })
  name: string;

  @ApiProperty({ description: 'Family name' })
  family: string;

  @ApiProperty({ description: 'Card number' })
  cardno: string;

  @ApiProperty({ description: 'Group ID' })
  groupid: string;

  @ApiProperty({ description: 'Email address' })
  email: string;

  @ApiProperty({ description: 'Company name' })
  company: string;

  @ApiProperty({ description: 'Registration date' })
  regdate: Date;

  @ApiProperty({ description: 'Picture URL' })
  pic: string;

  @ApiProperty({ description: 'Active status' })
  active: boolean;

  @ApiProperty({ description: 'Comment' })
  comment: string;
}
