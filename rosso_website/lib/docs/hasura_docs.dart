class HasuraDocs {
  final String sendMessageMutation = """
     mutation SendMessageMutation(\$nome: String!, \$mensagem: String!, \$email: String!, \$telefone: String!) {
  insert_mensagens(objects: {email: \$email, mensagem: \$mensagem, nome: \$nome, telefone: \$telefone}) {
    returning {
      mensagem_id
    }
  }
}
     """;
}
