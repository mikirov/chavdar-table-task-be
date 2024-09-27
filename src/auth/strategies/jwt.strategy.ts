import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { jwtConstants } from '../constants';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor() {
    super({
      // Extract JWT from the Authorization header as a Bearer token
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false, // JWT expiration will be checked
      secretOrKey: jwtConstants.secret,
    });
  }

  async validate(payload: any) {
    // The payload contains the decoded JWT properties
    return { userId: payload.sub, username: payload.username };
  }
}
