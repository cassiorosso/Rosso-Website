import 'dart:html';
import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/title_widget.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer.dart';

class AboutUsPage extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TittleWidget(title: "NOSSA HISTÓRIA"),
        Container(
          width: size.col_8(context: context),
          child: TextRenderer(
            element: ParagraphElement(),
            text: SelectableText(
              """\n          A empresa nasceu a partir da separação de uma sociedade no ano de 1988. Os irmãos Carlos e Dárcio Rosso assumiram o ponto localizado num antigo casarão situado na rua Camilo Ribeiro, no bairro São Cristóvão. A empresa fundada com o nome Agrícola Rosso precisou primeiro saudar dívidas advindas da antiga sociedade. Não havia funcionários e todo trabalho era feito pelos proprietários. Na epóca, trabalhavam com adubos, semente e algumas ferragens. Em 1992 mudaram para sede própria, construída no terreno do pai, localizado na rua Itararé, onde atualmente funciona o depósito da empresa.
            Maior e com uma clientela crescendo foi preciso contratar funcionários. Em 1995 compraram um terreno na Av. Presidente Vargas e com a ajuda do BRDE (Banco Rural de Crédito Empresárial) conseguiram construir uma loja mais ampla com clínica veterinária e ampliando significativamente o rol de produtos. Assim, acabaram mudando a razão social da empresa para Agrícola Veterinária Rosso.\n          Durante sua caminhada empresarial, a empresa sempre procurou formar grandes parcerias com vários fornecedores e também seguiu a tendência de crescimento e investimento no mercado pet. É representante exclusivo em Passo Fundo de algumas marcas como a Anhambi Nutrição Animal e também oferece assistência técnica de cultivo em propriedades rurais. Atualmente, possui nove funcionários e uma clínica veterinária terceirizada administrada por duas veterinárias.\n          Hoje, a loja oferece mais de seis mil itens no comércio de produtos agropecuários, camping e pesca, sementes e mudas, adubos e fertilizantes, rações e concentrados, ferragens e utilidades, produtos veterinários, bem como prestação de serviços procurando sempre atender o cliente com competência e seriedade."""
              "",
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 17, height: 1.4),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        SizedBox(height: 30),
        Wrap(
          runSpacing: 15,
          spacing: 5,
          children: [
            Container(
              width: size.isDesktop(context: context)
                  ? size.col_4(context: context)
                  : size.col_11(context: context),
              child: Image.asset(
                "assets/images/quemsomos2.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: size.isDesktop(context: context)
                  ? size.col_4(context: context)
                  : size.col_11(context: context),
              child: Image.asset(
                "assets/images/antigas_5.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: size.isDesktop(context: context)
                  ? size.col_4(context: context)
                  : size.col_11(context: context),
              child: Image.asset(
                "assets/images/antigas_4.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: size.isDesktop(context: context)
                  ? size.col_4(context: context)
                  : size.col_11(context: context),
              child: Image.asset(
                "assets/images/antigas_3.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: size.isDesktop(context: context)
                  ? size.col_4(context: context)
                  : size.col_11(context: context),
              child: Image.asset(
                "assets/images/antigas_2.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: size.isDesktop(context: context)
                  ? size.col_4(context: context)
                  : size.col_11(context: context),
              child: Image.asset(
                "assets/images/antigas_1.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Wrap(
          children: [
            textBloc(
                context,
                " MISSÃO",
                "Oferecer produtos e serviços de qualidade com competência e atendimento personalizado, buscando a satisfação do cliente.",
                Icon(
                  Icons.star,
                  size: 35,
                  color: Colors.amber[700],
                )),
            textBloc(
                context,
                " VISÃO",
                "Ser referência em agropecuária e Pet shop na cidade de Passo Fundo e região.",
                Icon(Icons.star, size: 35, color: Colors.amber[700])),
            textBloc(
                context,
                " PRINCÍPIOS E VALORES",
                """• Credibilidade e respeito ao cliente\n• Compromisso, responsabilidade e honestidade\n• Ética profissional\n• Profissionalismo e qualidade\n• Transparência""",
                Icon(Icons.star, size: 35, color: Colors.amber[700]))
          ],
        ),
      ],
    );
  }

  Widget textBloc(BuildContext context, String title, String text, Icon icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: size.isDesktop(context: context)
          ? size.col_5(context: context)
          : size.col_10(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.fade,
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              letterSpacing: 0.5,
              height: 1.5,
            ),
            //textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
