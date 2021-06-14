/// A message to show when user enters an invalid input 
private let notAvailable = "Enter a valid option or type help for more information"

/// To prepend to every message
private let voice = "Zoltar says:"

/// Enum of possible user input commands
private enum Command: String {
    case quit = "quit"
	case help = "help"

	var message: String? {
		switch self {
		case .quit: return nil
		case .help: return """
		\nZoltar is a simple program. When you are asked to choose one of the three options, type in either number 1, 2 or 3.\n
		"""
		}
	}
}

/// Options user can choose in the program
fileprivate enum Option: String {
	case future = "1"
	case past = "2"
	case zoltar = "3"

	func action() -> String? { 
		var message: String? = nil
		switch self {
		case .future:
			message = """
			\(voice) Your future is bright as the daylight in a sunny summer day!
			"""	
		case .past:
			message = """
			\(voice) Good memories shall stay. Bad memories shall go away.
			"""
		case .zoltar:
			message = """
			\(voice) I am a fortune teller machine best known for the movie Big. 
			This application however was built for fun.
			"""	
		}
		return message
	}
}

/// A greetings message to the user 
print("""
Welcome, I am Zoltar. Choose one of the following options:
1 - Tell me about my future.
2 - Tell me about my past.
3 - Tell me about Zoltar.

""")

/// A loop over the standart input
///
/// The loop waits for two types of user input:
/// - A commnad: help or quit
/// - An Option: 1, 2 or 3
while let input = readLine() {
    if let command = Command(rawValue: input) {
		if case .quit = command {
			break // This exits the program
		}

		command.message.flatMap { message in
			print(message)
		}
	}
	
	Option(rawValue: input).flatMap { option in
		if case .some(let string) = option.action() {
			print(string)
		} else {
			print(notAvailable)
		}
	}
}

