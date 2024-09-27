import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsBoolean, IsOptional, IsDateString } from 'class-validator';

export class CreateBuildingDto {
  @ApiProperty({ description: 'Name of the person' })
  @IsString()
  name: string;

  @ApiProperty({ description: 'Family name' })
  @IsString()
  family: string;

  @ApiProperty({ description: 'Card number' })
  @IsString()
  cardno: string;

  @ApiProperty({ description: 'Group ID' })
  @IsString()
  groupid: string;

  @ApiProperty({ description: 'Email address' })
  @IsString()
  email: string;

  @ApiProperty({ description: 'Company name' })
  @IsString()
  company: string;

  @ApiProperty({ description: 'Registration date', example: '2023-10-01' })
  @IsDateString()
  regdate: string;

  @ApiProperty({ description: 'Picture URL' })
  @IsString()
  pic: string;

  @ApiProperty({ description: 'Active status' })
  @IsBoolean()
  active: boolean;

  @ApiProperty({ description: 'Comment' })
  @IsString()
  comment: string;
}
