class HasuraDocs {
  final String sendMessageMutation = """
     mutation SendMessageMutation(\$nome: String!, \$mensagem: String!, \$email: String!, \$telefone: String!) {
      insert_website_db_mensagens(objects: {email: \$email, mensagem: \$mensagem, nome: \$nome, telefone: \$telefone}) {
    returning {
      id
    }
  }
}
     """;

  final String queryMessages = """
          query MensagensQuery(\$limit: Int!, \$offset: Int!) {
          website_db_mensagens(limit: \$limit, offset: \$offset, order_by: {created_at: desc}) {
            email
            id
            lido
            mensagem
            nome
            telefone
            created_at
          }
          website_db_mensagens_aggregate {
            aggregate {
              count
            }
          }
        }
  """;

  final String updateReadMessage = """
        mutation ReadMessageMutation(\$_eq: Int!) {
        update_website_db_mensagens(where: {id: {_eq: \$_eq}}, _set: {lido: true}) {
          affected_rows
        }
      }
  """;

  final String categoriesQuery = """
          query CategoriesQuery {
          website_db_produtos_categorias {
            id
            nome
            produtos_sub_categorias {
              id
              nome
              categoria_id
            }
          }
        }
 """;

  final String productsQuery = """
          query getProducts(\$limit: Int!, \$offset: Int!) {
          website_db_produtos(limit: \$limit, offset: \$offset) {
            id
            nome
            visivel
            destaque
            categoria_id
            sub_categoria_id
            cod_referencia
            produtos_imagens {
              url
            }
          }
          website_db_produtos_aggregate {
            aggregate {
              count
            }
          }
        }
      """;

  final String searchNameQuery = """
        query SearchNameQuery(\$_ilike: String!, \$limit: Int!, \$offset: Int!) {
        website_db_produtos(where: {nome: {_ilike: \$_ilike}}, limit: \$limit, offset: \$offset) {
          nome
          id
          visivel
          categoria_id
          sub_categoria_id
          destaque
          cod_referencia
          produtos_imagens {
            url
          }
        }
        website_db_produtos_aggregate(where: {nome: {_ilike: \$_ilike}}) {
          aggregate {
            count
          }
        }
      }
  """;

  final String searchDescriptionQuery = """
        query SearchNameQuery(\$_ilike: String!, \$limit: Int!, \$offset: Int!) {
        website_db_produtos(where: {_and: {descricao: {_ilike: \$_ilike}, nome: {_nilike: \$_ilike}}}, limit: \$limit, offset: \$offset) {
          nome
          id
          visivel
          destaque
          categoria_id
          sub_categoria_id
          cod_referencia
          produtos_imagens {
            url
          }
        }
        website_db_produtos_aggregate(where: {_and: {descricao: {_ilike: \$_ilike}, nome: {_nilike: \$_ilike}}}) {
          aggregate {
            count
          }
        }
      }
  """;

  final String productsBySubCategoryQuery = """
        query ProductsByCategoryQuery(\$_eq: Int!, \$limit: Int!, \$offset: Int!) {
        website_db_produtos(where: {sub_categoria_id: {_eq: \$_eq}, visivel: {_eq: true}}, limit: \$limit, offset: \$offset) {
          nome
          id
          visivel
          destaque
          categoria_id
          sub_categoria_id
          cod_referencia
          produtos_imagens {
            url
          }
        }
        website_db_produtos_aggregate(where: {sub_categoria_id: {_eq: \$_eq}}) {
          aggregate {
            count
          }
        }
      }
 """;

  final String spotLightProducts = """
          query SpotlightProducts {
          website_db_produtos(limit: 12, where: {destaque: {_eq: true}}) {
            id
            nome
            visivel
            produtos_imagens {
              url
            }
          }
        }
  """;

  final String productQuery = """
          query productQuery(\$_id: Int = 10) {
          website_db_produtos(where: {id: {_eq: \$_id}}) {
            nome
            id
            estoque
            destaque
            cod_referencia
            descricao
            categoria_id
            sub_categoria_id
            visivel
            produtos_imagens {
              url
            }
          }
        }
  """;

  final String loginQuery = """
            query LoginQuery{
            website_db_usuarios {
              email
              token
            }
          }
  """;

  final String updateProduct = """
        mutation UpdateProduct(\$id: Int!, \$sub_categoria_id: Int!, \$visivel: Boolean!, \$categoria_id: Int!, \$destaque: Boolean! ) {
        update_website_db_produtos(where: {id: {_eq: \$id}}, _set: {sub_categoria_id: \$sub_categoria_id, visivel: \$visivel, categoria_id: \$categoria_id, destaque: \$destaque}) {
          affected_rows
        }
      }
  """;

  final String insertImageUrl = """
          mutation insertImageUrl(\$produto_id: Int!, \$url: String!) {
          insert_website_db_produtos_imagens(objects: {produto_id: \$produto_id, url: \$url}) {
            affected_rows
          }
        }
  """;

  final String deleteImage = """
        mutation deleteImageUrl(\$_eq: String = "") {
        delete_website_db_produtos_imagens(where: {url: {_eq: \$_eq}}) {
          affected_rows
        }
      }
  """;

  final String queryBanners = """
          query getBanners {
            website_db_banners(where: {visible: {_eq: true}}) {
              url
              isMobile
            }
          }
  """;

  final String queryDestaques = """
          query DestaquesQuery(\$offset: Int!, \$limit: Int!) {
          website_db_produtos(where: {destaque: {_eq: true}}, limit: \$limit, offset: \$offset) {
            nome
            id
            destaque
            cod_referencia
            categoria_id
            sub_categoria_id
            visivel
            produtos_imagens {
              url
            }
          }
          website_db_produtos_aggregate(where: {destaque: {_eq: true}}) {
            aggregate {
              count
            }
          }
        }
  """;

  final String queryNaoVisiveis = """
          query NaoVisiveisQuery(\$offset: Int!, \$limit: Int!) {
          website_db_produtos(where: {visivel: {_eq: false}}, limit: \$limit, offset: \$offset) {
            nome
            id
            destaque
            cod_referencia
            categoria_id
            sub_categoria_id
            visivel
            produtos_imagens {
              url
            }
          }
          website_db_produtos_aggregate(where: {visivel: {_eq: false}}) {
            aggregate {
              count
            }
          }
        }
  """;

  final String queryEstoque = """
        query EstoqueQuery(\$offset: Int!, \$limit: Int!, \$estoque: float8!) {
        website_db_produtos(where: {estoque: {_eq: \$estoque}}, limit: \$limit, offset: \$offset) {
          nome
          id
          destaque
          cod_referencia
          categoria_id
          sub_categoria_id
          visivel
          produtos_imagens {
            url
          }
        }
        website_db_produtos_aggregate(where: {estoque: {_eq: \$estoque }}) {
          aggregate {
            count
          }
        }
      }
  """;
}
