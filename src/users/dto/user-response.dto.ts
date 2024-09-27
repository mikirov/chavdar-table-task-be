import { ApiProperty } from '@nestjs/swagger';

export class UserResponseDto {
  @ApiProperty({ description: 'Unique id for the user' })
  id: number;
  @ApiProperty({ description: 'Unique username for the user' })
  username: string;
  @ApiProperty({ description: 'Accessible tables of the user' })
  accessibleTables: string[];
}
