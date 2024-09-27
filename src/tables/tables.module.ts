import { Module } from '@nestjs/common';
import { TablesService } from './tables.service';
import { TablesController } from './tables.controller';
import { UsersModule } from '../users/users.module';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    UsersModule,
    TypeOrmModule.forFeature([]), // Import TypeOrmModule here
  ],
  controllers: [TablesController],
  providers: [TablesService],
})
export class TablesModule {}
