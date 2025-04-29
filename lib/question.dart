class Question {
  final String text;
  final List<String> options;
  final String answer;
  final String image;

  Question({
    required this.text,
    required this.options,
    required this.answer,
    required this.image,
  });
}

List<Question> questions = [
  Question(
    text: 'Qual é o maior planeta do Sistema Solar?',
    options: ['Terra', 'Marte', 'Júpiter', 'Vênus'],
    answer: 'Júpiter',
    image: 'perg1.jpg',
  ),
  Question(
    text: 'Qual planeta é conhecido como o planeta vermelho?',
    options: ['Mercúrio', 'Marte', 'Saturno', 'Netuno'],
    answer: 'Marte',
    image: 'perg2.jpg',
  ),
  Question(
    text: 'Qual planeta é o mais próximo do Sol?',
    options: ['Terra', 'Mercúrio', 'Vênus', 'Marte'],
    answer: 'Mercúrio',
    image: 'perg3.jpg',
  ),
  Question(
    text: 'Qual planeta tem os anéis mais visíveis?',
    options: ['Júpiter', 'Saturno', 'Urano', 'Netuno'],
    answer: 'Saturno',
    image: 'perg4.jpg',
  ),
  Question(
    text: 'Qual é o planeta mais distante do Sol?',
    options: ['Netuno', 'Urano', 'Plutão', 'Saturno'],
    answer: 'Netuno',
    image: 'perg5.jpg',
  ),
  Question(
    text: 'Qual planeta tem o maior número de luas?',
    options: ['Terra', 'Júpiter', 'Saturno', 'Marte'],
    answer: 'Júpiter',
    image: 'perg6.jpg',
  ),
  Question(
    text: 'Qual é o único planeta que gira no sentido horário?',
    options: ['Vênus', 'Marte', 'Urano', 'Mercúrio'],
    answer: 'Vênus',
    image: 'perg7.jpg',
  ),
  Question(
    text: 'Qual é o planeta conhecido como o "gigante gasoso"?',
    options: ['Saturno', 'Júpiter', 'Urano', 'Netuno'],
    answer: 'Júpiter',
    image: 'perg8.jpg',
  ),
  Question(
    text: 'Qual planeta é conhecido por sua cor azul devido ao metano na atmosfera?',
    options: ['Vênus', 'Netuno', 'Júpiter', 'Marte'],
    answer: 'Netuno',
    image: 'perg9.jpg',
  ),
  Question(
    text: 'Qual é o nome da maior lua de Saturno?',
    options: ['Titan', 'Ganimedes', 'Io', 'Europa'],
    answer: 'Titan',
    image: 'perg10.jpg',
  ),
];