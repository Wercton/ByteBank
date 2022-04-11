class Transfer {
  final double value;
  final String transferDescription;

  Transfer(this.value, this.transferDescription);

  @override
  String toString() {
    return 'Transfer{value: $value, transferDescription: $transferDescription}';
  }
}
