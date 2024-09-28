import { MiddlewareConsumer, Module, RequestMethod } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { TablesModule } from './tables/tables.module';
import { BuildingsModule } from './buildings/buildings.module';
import { OptionsMiddleware } from './middleware/options.middleware';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost', // Your DB host
      port: 3306, // Your DB port
      username: 'root', // Your DB username
      password: 'root', // Your DB password
      database: 'myadmindb', // Your database name
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: false, // Set to false in production
    }),
    BuildingsModule,
    AuthModule,
    UsersModule,
    TablesModule, // Add TablesModule here
  ],
})
export class AppModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(OptionsMiddleware)
      .forRoutes({ path: '*', method: RequestMethod.ALL });
  }
}
