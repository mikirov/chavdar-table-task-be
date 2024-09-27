import {
  Controller,
  Get,
  Post,
  Delete,
  Body,
  Param,
  UseGuards,
  Request,
  BadRequestException,
} from '@nestjs/common';
import { TablesService } from './tables.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { User } from '../users/entities/user.entity';
import {
  ApiTags,
  ApiBearerAuth,
  ApiOperation,
  ApiResponse,
  ApiBody,
  ApiParam,
} from '@nestjs/swagger';
import { MessageResponseDto } from './../common/dto/message-response.dto';
import { CreateTableDto } from './dto/create-table.dto';

@ApiTags('tables')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('tables')
export class TablesController {
  constructor(private readonly tablesService: TablesService) {}

  // Get all tables the user is allowed to see
  @ApiOperation({ summary: 'Get all tables the user is allowed to see' })
  @ApiResponse({
    status: 200,
    description: 'List of tables the user can access',
    type: [String],
  })
  @Get()
  async getUserTables(@Request() req): Promise<string[]> {
    const user: User = req.user;
    return this.tablesService.getUserTables(user);
  }

  // Create a new table
  @ApiOperation({ summary: 'Create a new table' })
  @ApiResponse({
    status: 201,
    description: 'Table created successfully',
    type: MessageResponseDto,
  })
  @ApiResponse({
    status: 400,
    description: 'Invalid table name or table already exists',
  })
  @ApiBody({ type: CreateTableDto })
  @Post()
  async createTable(
    @Request() req,
    @Body() createTableDto: CreateTableDto,
  ): Promise<MessageResponseDto> {
    const { tableName } = createTableDto;

    if (!tableName) {
      throw new BadRequestException('Table name is required');
    }

    const user: User = req.user;
    await this.tablesService.createTable(user, tableName);

    return { message: `Table ${tableName} created successfully` };
  }

  // Delete a table
  @ApiOperation({ summary: 'Delete a table' })
  @ApiResponse({
    status: 200,
    description: 'Table deleted successfully',
    type: MessageResponseDto,
  })
  @ApiResponse({
    status: 400,
    description: 'Invalid table name or table does not exist',
  })
  @ApiResponse({
    status: 401,
    description: 'Unauthorized to delete this table',
  })
  @ApiParam({
    name: 'tableName',
    description: 'Name of the table to delete',
    example: 'BuildingA3',
  })
  @Delete(':tableName')
  async deleteTable(
    @Request() req,
    @Param('tableName') tableName: string,
  ): Promise<MessageResponseDto> {
    if (!tableName) {
      throw new BadRequestException('Table name is required');
    }

    const user: User = req.user;
    await this.tablesService.deleteTable(user, tableName);

    return { message: `Table ${tableName} deleted successfully` };
  }
}
