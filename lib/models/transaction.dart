// Definición de la clase `Transaction` que representa una transacción financiera.
class Transaction {
  // Campos finales que representan las propiedades de una transacción.
  // `name` es una cadena que almacena el nombre de la transacción.
  final String name;

  // `date` es una cadena que almacena la fecha de la transacción.
  final String date;

  // `amount` es un número de punto flotante que almacena el monto de la transacción.
  final double amount;

  // `isCredit` es un booleano que indica si la transacción es un crédito (true) o un débito (false).
  final bool isCredit;

  // Constructor de la clase `Transaction` que inicializa los campos con valores proporcionados.
  // Todos los campos son requeridos, lo que significa que deben ser proporcionados al crear una instancia de `Transaction`.
  Transaction({
    required this.name, // Inicializa el campo `name` con el valor proporcionado.
    required this.date, // Inicializa el campo `date` con el valor proporcionado.
    required this.amount, // Inicializa el campo `amount` con el valor proporcionado.
    required this.isCredit, // Inicializa el campo `isCredit` con el valor proporcionado.
  });
}
