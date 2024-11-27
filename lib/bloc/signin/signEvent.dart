
abstract class SignEvent{
  SignEvent();
}

class EmailEvent extends SignEvent{
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SignEvent{
  final String password;
  PasswordEvent(this.password);
}