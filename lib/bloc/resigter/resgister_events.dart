abstract class RegisterEvent {
  RegisterEvent();
}

class UsernameEvent extends RegisterEvent {
  final String username;
  UsernameEvent(this.username);
}

class Email_Event extends RegisterEvent {
  final String email;
  Email_Event(
    this.email,
  );
}

class Password_Event extends RegisterEvent {
  final String password;
  Password_Event(
    this.password,
  );
}

class RePassword_Event extends RegisterEvent {
  final String rePassword;
  RePassword_Event(
    this.rePassword,
  );
}
