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

@Controller('buildings')
@UseGuards(JwtAuthGuard)
export class BuildingsController {
  constructor(
    private readonly buildingsService: BuildingsService,
    private readonly usersService: UsersService,
  ) {}

  @Get(':tableName')
  async findAll(@Param('tableName') tableName: string, @Request() req) {
    const user = await this.getUserWithAccessibleTables(req.user.userId);
    return this.buildingsService.findAll(user, tableName);
  }

  @Post(':tableName')
  async create(
    @Param('tableName') tableName: string,
    @Body() createData: any,
    @Request() req,
  ) {
    const user = await this.getUserWithAccessibleTables(req.user.userId);
    return this.buildingsService.create(user, tableName, createData);
  }

  @Post(':tableName/:id')
  async update(
    @Param('tableName') tableName: string,
    @Param('id') id: number,
    @Body() updateData: any,
    @Request() req,
  ) {
    const user = await this.getUserWithAccessibleTables(req.user.userId);
    return this.buildingsService.update(user, tableName, id, updateData);
  }

  @Delete(':tableName/:id')
  async remove(
    @Param('tableName') tableName: string,
    @Param('id') id: number,
    @Request() req,
  ) {
    const user = await this.getUserWithAccessibleTables(req.user.userId);
    return this.buildingsService.remove(user, tableName, id);
  }

  private async getUserWithAccessibleTables(userId: number) {
    const user = await this.usersService.findById(userId);
    if (!user) {
      throw new UnauthorizedException('User not found');
    }
    return user;
  }
}
