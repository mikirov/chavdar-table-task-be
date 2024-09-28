// jwt-auth.guard.ts
import { Injectable, ExecutionContext } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {
  canActivate(context: ExecutionContext) {
    const request = context.switchToHttp().getRequest<Request>();

    console.log(`JwtAuthGuard: ${request.method} ${request.url}`);

    if (request.method === 'OPTIONS') {
      console.log('JwtAuthGuard: Allowing OPTIONS request');
      return true;
    }

    return super.canActivate(context);
  }
}
