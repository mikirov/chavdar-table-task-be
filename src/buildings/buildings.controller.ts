import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
  UseGuards,
  Request,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { BuildingsService } from './buildings.service';
import { UsersService } from '../users/users.service';

@Controller('tables')
@UseGuards(JwtAuthGuard)
export class BuildingsController {
  constructor(
    private readonly buildingsService: BuildingsService,
    private readonly usersService: UsersService,
  ) {}

  // Get all records from any table
  @Get(':tableName')
  async findAll(@Param('tableName') tableName: string, @Request() req) {
    const user = await this.getUserWithAccessibleTables(req.user.userId);
    return this.buildingsService.findAll(user, tableName);
  }

  // Create a new record in any table
  @Post(':tableName')
  async create(
    @Param('tableName') tableName: string,
    @Body() createData: any,
    @Request() req,
  ) {
    const user = await this.getUserWithAccessibleTables(req.user.userId);
    return this.buildingsService.create(user, tableName, createData);
  }

  // Update a record in any table
  @Put(':tableName/:id')
  async update(
    @Param('tableName') tableName: string,
    @Param('id') id: number,
    @Body() updateData: any,
    @Request() req,
  ) {
    const user = await this.getUserWithAccessibleTables(req.user.userId);
    return this.buildingsService.update(user, tableName, id, updateData);
  }

  // Delete a record from any table
  @Delete(':tableName/:id')
  async remove(
    @Param('tableName') tableName: string,
    @Param('id') id: number,
    @Request() req,
  ) {
    const user = await this.getUserWithAccessibleTables(req.user.userId);
    return this.buildingsService.remove(user, tableName, id);
  }

  // Helper method to fetch user and validate accessible tables
  private async getUserWithAccessibleTables(userId: number) {
    const user = await this.usersService.findById(userId);
    if (!user) {
      throw new UnauthorizedException('User not found');
    }
    return user;
  }
}
