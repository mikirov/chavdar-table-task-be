import { Injectable, UnauthorizedException } from '@nestjs/common';
import { UsersService } from '../users/users.service';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';
import { User } from '../users/entities/user.entity';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}

  // Validate user credentials
  async validateUser(username: string, pass: string): Promise<any> {
    console.log('AuthService.validateUser - Username:', username);
    const user = await this.usersService.findOneByUsername(username);
    console.log('User found:', user);

    // Validate user and password
    if (user && (await bcrypt.compare(pass, user.password))) {
      // Exclude password from the returned user object
      const { password, ...result } = user;
      return result;
    }
    return null;
  }

  // Generate JWT token
  async login(user: User) {
    console.log('User in AuthService.login:', user);
    const payload = { username: user.username, sub: user.id };
    return {
      access_token: this.jwtService.sign(payload),
    };
  }
}
