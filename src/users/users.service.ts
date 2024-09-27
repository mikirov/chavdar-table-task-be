import { Injectable, ConflictException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { In, Repository } from 'typeorm';
import { User } from './entities/user.entity';
import { CreateUserDto } from './dto/create-user.dto';
import { UserResponseDto } from './dto/user-response.dto';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}

  // Find a user by username
  async findOneByUsername(username: string): Promise<User | undefined> {
    console.log('UsersService.findOneByUsername - Username:', username);
    return this.usersRepository.findOne({
      where: { username },
    });
  }

  // Find a user by ID
  async findById(id: number): Promise<User | undefined> {
    return this.usersRepository.findOne({
      where: { id },
    });
  }

  // Create a new user
  async create(createUserDto: CreateUserDto): Promise<User> {
    const { username, password, accessibleTables } = createUserDto;

    // Check if the username is already taken
    const existingUser = await this.findOneByUsername(username);
    if (existingUser) {
      throw new ConflictException('Username already exists');
    }

    // Hash the password
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);

    // Create the user entity
    const user = this.usersRepository.create({
      username,
      password: hashedPassword,
      accessibleTables,
    });

    // Save the user to the database
    return this.usersRepository.save(user);
  }

  // Convert User entity to UserResponseDto
  toResponseObject(user: User): UserResponseDto {
    const { ...result } = user;
    return result;
  }

  async updateAccessibleTables(
    userId: number,
    accessibleTables: string[],
  ): Promise<void> {
    await this.usersRepository.update(userId, { accessibleTables });
  }
  async removeTableFromAllUsers(tableName: string): Promise<void> {
    const users = await this.usersRepository.find({
      where: {
        accessibleTables: In([tableName]),
      },
    });

    for (const user of users) {
      user.accessibleTables = user.accessibleTables.filter(
        (t) => t !== tableName,
      );
      await this.usersRepository.save(user);
    }
  }
}
