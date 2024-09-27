// src/buildings/buildings.module.ts
import { Module, forwardRef } from '@nestjs/common';
import { BuildingsService } from './buildings.service';
import { BuildingsController } from './buildings.controller';
import { AuthModule } from '../auth/auth.module';
import { UsersModule } from '../users/users.module';

@Module({
  imports: [
    forwardRef(() => AuthModule),
    forwardRef(() => UsersModule), // Use forwardRef here
  ],
  controllers: [BuildingsController],
  providers: [BuildingsService],
  exports: [BuildingsService], // Export if needed elsewhere
})
export class BuildingsModule {}
