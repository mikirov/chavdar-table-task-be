import { IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class LoginDto {
  @ApiProperty({ example: 'userA' })
  @IsString()
  username: string;

  @ApiProperty({ example: 'passwordA' })
  @IsString()
  password: string;
}
