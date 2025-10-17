import 'package:flutter/material.dart';

import '../models/categoria.dart';
import '../models/receita.dart';

final List<Categoria> dataSet = [
  Categoria(
    id: 'c1',
    titulo: 'Italiana',
    cor: Colors.red,
    descricao: 'Massas, pizzas e molhos clássicos da culinária italiana.',
    imagemUrl:
        'https://images.unsplash.com/photo-1535930739174-9a685750342f?w=400',
    receitas: [
      Receita(
        id: 'r1',
        titulo: 'Espaguete à Carbonara',
        descricao: 'Clássico italiano com ovos, queijo e bacon.',
        imagemUrl:
            'https://images.unsplash.com/photo-1621996346565-e3dbc353d2e5?w=400',
        tempoPreparo: 25,
        dificuldade: Dificuldade.medio,
        ingredientes: [
          '200g de espaguete',
          '100g de bacon em cubos',
          '2 ovos inteiros + 1 gema',
          '50g de queijo parmesão ralado',
          'Sal e pimenta preta a gosto',
          '1 dente de alho',
        ],
        passos: [
          'Cozinhe o espaguete em água salgada até ficar al dente.',
          'Enquanto isso, frite o bacon em fogo médio até ficar crocante.',
          'Em uma tigela, bata os ovos com o queijo parmesão e pimenta.',
          'Escorra a massa e misture rapidamente com o bacon ainda quente.',
          'Adicione a mistura de ovos, mexendo bem para criar um creme.',
          'Sirva imediatamente com mais queijo parmesão.',
        ],
      ),
      Receita(
        id: 'r2',
        titulo: 'Pizza Margherita',
        descricao:
            'Pizza clássica com molho de tomate, mussarela e manjericão fresco.',
        imagemUrl:
            'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?w=400',
        tempoPreparo: 40,
        dificuldade: Dificuldade.medio,
        ingredientes: [
          '500g de massa de pizza',
          '200ml de molho de tomate',
          '300g de queijo mussarela',
          'Folhas frescas de manjericão',
          '2 colheres de azeite de oliva',
          'Sal a gosto',
        ],
        passos: [
          'Preaqueça o forno a 220°C.',
          'Abra a massa em forma circular.',
          'Espalhe o molho de tomate uniformemente.',
          'Adicione o queijo mussarela em fatias.',
          'Asse por 15-20 minutos até a massa dourar.',
          'Finalize com manjericão fresco e azeite.',
        ],
      ),
    ],
  ),
  Categoria(
    id: 'c2',
    titulo: 'Rápido & Fácil',
    cor: Colors.orange,
    descricao: 'Receitas práticas que ficam prontas em poucos minutos.',
    imagemUrl:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
    receitas: [
      Receita(
        id: 'r3',
        titulo: 'Omelete de Queijo',
        descricao: 'Rápido, nutritivo e delicioso para qualquer refeição.',
        imagemUrl:
            'https://images.unsplash.com/photo-1595257841889-eca2678457b9?w=400',
        tempoPreparo: 10,
        dificuldade: Dificuldade.facil,
        ingredientes: [
          '2 ovos grandes',
          '50g de queijo mussarela ralado',
          '1 colher de sopa de leite',
          'Sal e pimenta a gosto',
          '1 colher de manteiga',
        ],
        passos: [
          'Bata os ovos com leite, sal e pimenta.',
          'Aqueça a manteiga em uma frigideira antiaderente.',
          'Despeje a mistura e cozinhe em fogo médio.',
          'Adicione o queijo quando a base estiver firme.',
          'Dobre a omelete e sirva quente.',
        ],
      ),
    ],
  ),
  Categoria(
    id: 'c3',
    titulo: 'Asiática',
    cor: Colors.teal,
    descricao: 'Sabores intensos e aromáticos do oriente.',
    imagemUrl:
        'https://images.unsplash.com/photo-1553621042-f6e147245754?w=400',
    receitas: [
      Receita(
        id: 'r4',
        titulo: 'Yakissoba Tradicional',
        descricao: 'Macarrão oriental com legumes e molho shoyu.',
        imagemUrl:
            'https://images.unsplash.com/photo-1555126634-323283a090fa?w=400',
        tempoPreparo: 30,
        dificuldade: Dificuldade.medio,
        ingredientes: [
          '300g de macarrão para yakissoba',
          '200g de carne bovina em tiras',
          '2 cenouras em rodelas',
          '1 pimentão vermelho em tiras',
          '100g de brócolis',
          '4 colheres de molho shoyu',
        ],
        passos: [
          'Cozinhe o macarrão conforme instruções da embalagem.',
          'Refogue a carne até dourar.',
          'Adicione os legumes e cozinhe até ficarem al dente.',
          'Misture o macarrão escorrido.',
          'Acrescente o shoyu e mexa bem.',
          'Sirva imediatamente.',
        ],
      ),
    ],
  ),
  Categoria(
    id: 'c4',
    titulo: 'Saudável',
    cor: Colors.green,
    descricao: 'Receitas leves, equilibradas e cheias de nutrientes.',
    imagemUrl:
        'https://images.unsplash.com/photo-1490818387583-1baba5e638af?w=400',
    receitas: [
      Receita(
        id: 'r5',
        titulo: 'Salada Mediterrânea',
        descricao: 'Leve, refrescante e rica em fibras e antioxidantes.',
        imagemUrl:
            'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400',
        tempoPreparo: 15,
        dificuldade: Dificuldade.facil,
        ingredientes: [
          '1 alface romana',
          '2 tomates maduros',
          '1 pepino japonês',
          '100g de queijo feta',
          'Azeitonas pretas',
          'Azeite de oliva extra virgem',
        ],
        passos: [
          'Lave e corte todos os vegetais.',
          'Pique a alface em pedaços médios.',
          'Corte tomates e pepino em cubos.',
          'Adicione as azeitonas e queijo feta.',
          'Tempere com azeite e orégano.',
          'Misture suavemente e sirva.',
        ],
      ),
    ],
  ),
  Categoria(
    id: 'c5',
    titulo: 'Brasileira',
    cor: Colors.blue,
    descricao: 'Pratos típicos e sabores regionais do Brasil.',
    imagemUrl:
        'https://images.unsplash.com/photo-1481931098730-318b6f776db0?w=400',
    receitas: [
      Receita(
        id: 'r6',
        titulo: 'Feijoada Completa',
        descricao: 'Tradicional prato brasileiro com feijão preto e carnes.',
        imagemUrl:
            'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=400',
        tempoPreparo: 120,
        dificuldade: Dificuldade.dificil,
        ingredientes: [
          '500g de feijão preto',
          '300g de carne seca',
          '200g de linguiça calabresa',
          '150g de paio',
          '2 cebolas picadas',
          '4 dentes de alho',
        ],
        passos: [
          'Deixe o feijão de molho por 8 horas.',
          'Cozinhe as carnes separadamente.',
          'Refogue cebola e alho.',
          'Adicione o feijão e as carnes.',
          'Cozinhe em fogo baixo por 2 horas.',
          'Ajuste os temperos e sirva com arroz.',
        ],
      ),
    ],
  ),
  Categoria(
    id: 'c6',
    titulo: 'Sobremesas',
    cor: Colors.purple,
    descricao: 'Doces irresistíveis para todos os gostos.',
    imagemUrl:
        'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=400',
    receitas: [
      Receita(
        id: 'r7',
        titulo: 'Brownie de Chocolate',
        descricao: 'Brownie fudgy com casca crocante e interior macio.',
        imagemUrl:
            'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=400',
        tempoPreparo: 45,
        dificuldade: Dificuldade.medio,
        ingredientes: [
          '200g de chocolate meio amargo',
          '150g de manteiga',
          '3 ovos',
          '200g de açúcar',
          '100g de farinha de trigo',
          '50g de cacau em pó',
        ],
        passos: [
          'Derreta chocolate e manteiga em banho-maria.',
          'Bata os ovos com açúcar até esbranquiçar.',
          'Misture os ingredientes secos peneirados.',
          'Asse a 180°C por 25 minutos.',
          'Deixe esfriar antes de cortar.',
        ],
      ),
    ],
  ),
  Categoria(
    id: 'c7',
    titulo: 'Vegetariana',
    cor: Colors.lightGreen,
    descricao: 'Pratos saborosos sem carne, ricos em vegetais.',
    imagemUrl:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400',
    receitas: [
      Receita(
        id: 'r8',
        titulo: 'Lasanha de Berinjela',
        descricao: 'Lasanha vegetariana com berinjela e queijos.',
        imagemUrl:
            'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=400',
        tempoPreparo: 60,
        dificuldade: Dificuldade.medio,
        ingredientes: [
          '2 berinjelas médias',
          '500g de molho de tomate',
          '250g de queijo mussarela',
          '100g de queijo parmesão',
          'Manjericão fresco',
          'Azeite de oliva',
        ],
        passos: [
          'Corte as berinjelas em fatias e grelhe.',
          'Monte camadas com molho, berinjela e queijos.',
          'Repita as camadas terminando com queijo.',
          'Asse a 200°C por 30 minutos.',
          'Deixe descansar antes de servir.',
        ],
      ),
    ],
  ),
  Categoria(
    id: 'c8',
    titulo: 'Frutos do Mar',
    cor: Colors.blue,
    descricao: 'Pratos sofisticados com peixes e frutos do mar.',
    imagemUrl:
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=400',
    receitas: [
      Receita(
        id: 'r9',
        titulo: 'Salmão Grelhado',
        descricao: 'Salmão grelhado com ervas e limão.',
        imagemUrl:
            'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400',
        tempoPreparo: 20,
        dificuldade: Dificuldade.facil,
        ingredientes: [
          '4 filés de salmão',
          'Suco de 1 limão',
          '2 colheres de azeite',
          'Sal e pimenta a gosto',
          'Ervas frescas (salsinha, endro)',
        ],
        passos: [
          'Tempere o salmão com sal, pimenta e limão.',
          'Aqueça a grelha com azeite.',
          'Grelhe cada lado por 4-5 minutos.',
          'Finalize com ervas frescas.',
          'Sirva com legumes grelhados.',
        ],
      ),
    ],
  ),
  Categoria(
    id: 'c9',
    titulo: 'Café da Manhã',
    cor: Colors.amber,
    descricao: 'Receitas matinais para começar o dia com energia.',
    imagemUrl:
        'https://images.unsplash.com/photo-1551782450-17144efb9c50?w=400',
    receitas: [
      Receita(
        id: 'r10',
        titulo: 'Panquecas Americanas',
        descricao: 'Panquecas fofas e douradas com mel ou maple syrup.',
        imagemUrl:
            'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400',
        tempoPreparo: 25,
        dificuldade: Dificuldade.facil,
        ingredientes: [
          '1 xícara de farinha de trigo',
          '1 xícara de leite',
          '1 ovo',
          '2 colheres de açúcar',
          '1 colher de fermento em pó',
          '1 pitada de sal',
        ],
        passos: [
          'Misture todos os ingredientes secos.',
          'Adicione os líquidos e mexa suavemente.',
          'Aqueça uma frigideira antiaderente.',
          'Despeje porções da massa.',
          'Vire quando formar bolhas na superfície.',
          'Sirva com mel ou frutas.',
        ],
      ),
    ],
  ),
  Categoria(
    id: 'c10',
    titulo: 'Churrasco',
    cor: Colors.blueGrey,
    descricao: 'Cortes especiais e técnicas para churrasco perfeito.',
    imagemUrl:
        'https://images.unsplash.com/photo-1558036117-15e82a2c9a9a?w=400',
    receitas: [
      Receita(
        id: 'r11',
        titulo: 'Picanha na Churrasqueira',
        descricao: 'Picanha suculenta com sal grosso e tempero simples.',
        imagemUrl:
            'https://images.unsplash.com/photo-1551388293-4a6c9a5c4b5a?w=400',
        tempoPreparo: 40,
        dificuldade: Dificuldade.medio,
        ingredientes: [
          '1 peça de picanha (1,5kg)',
          'Sal grosso a gosto',
          '4 dentes de alho amassados',
          'Pimenta do reino',
        ],
        passos: [
          'Tempere a picanha com alho e pimenta.',
          'Deixe descansar por 30 minutos.',
          'Aqueça a churrasqueira.',
          'Grelhe com sal grosso.',
          'Vire até ponto desejado.',
          'Deixe descansar antes de fatiar.',
        ],
      ),
    ],
  ),
  // Categoria(
  //   id: 'c11',
  //   titulo: 'Low Carb',
  //   cor: Colors.lightBlue,
  //   descricao: 'Receitas com baixo teor de carboidratos.',
  //   imagemUrl:
  //       'https://images.unsplash.com/photo-1490818387583-1baba5e638af?w=400',
  //   receitas: [
  //     Receita(
  //       id: 'r12',
  //       titulo: 'Couve-Flor Gratinada',
  //       descricao: 'Gratinado low carb com couve-flor e queijos.',
  //       imagemUrl:
  //           'https://images.unsplash.com/photo-1570197788417-0e82375c9371?w=400',
  //       tempoPreparo: 35,
  //       dificuldade: Dificuldade.facil,
  //       ingredientes: [
  //         '1 couve-flor média',
  //         '200g de queijo cheddar',
  //         '100ml de creme de leite',
  //         '50g de queijo parmesão',
  //         'Manteiga para untar',
  //       ],
  //       passos: [
  //         'Cozinhe a couve-flor até ficar al dente.',
  //         'Misture com creme de leite e cheddar.',
  //         'Transfira para uma forma untada.',
  //         'Polvilhe parmesão por cima.',
  //         'Asse a 200°C por 20 minutos.',
  //       ],
  //     ),
  //   ],
  // ),
  // Categoria(
  //   id: 'c12',
  //   titulo: 'Sopas & Caldos',
  //   cor: Colors.orange,
  //   descricao: 'Reconfortantes sopas para dias frios.',
  //   imagemUrl:
  //       'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400',
  //   receitas: [
  //     Receita(
  //       id: 'r13',
  //       titulo: 'Sopa de Legumes',
  //       descricao: 'Sopa cremosa e nutritiva com legumes da estação.',
  //       imagemUrl:
  //           'https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?w=400',
  //       tempoPreparo: 50,
  //       dificuldade: Dificuldade.facil,
  //       ingredientes: [
  //         '2 batatas médias',
  //         '2 cenouras',
  //         '1 cebola',
  //         '1 abobrinha',
  //         '1 litro de caldo de legumes',
  //         'Azeite e sal',
  //       ],
  //       passos: [
  //         'Pique todos os legumes em cubos.',
  //         'Refogue a cebola em azeite.',
  //         'Adicione os legumes e caldo.',
  //         'Cozinhe por 30 minutos.',
  //         'Bata com mixer se desejar creme.',
  //         'Ajuste temperos e sirva.',
  //       ],
  //     ),
  //   ],
  // ),
  // Categoria(
  //   id: 'c13',
  //   titulo: 'Massas',
  //   cor: Colors.yellow,
  //   descricao: 'Variedade de massas com molhos especiais.',
  //   imagemUrl:
  //       'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=400',
  //   receitas: [
  //     Receita(
  //       id: 'r14',
  //       titulo: 'Fettuccine Alfredo',
  //       descricao: 'Massa com molho cremoso de queijo parmesão.',
  //       imagemUrl:
  //           'https://images.unsplash.com/photo-1605537925581-0156d1d4e4c3?w=400',
  //       tempoPreparo: 25,
  //       dificuldade: Dificuldade.medio,
  //       ingredientes: [
  //         '250g de fettuccine',
  //         '200ml de creme de leite fresco',
  //         '100g de queijo parmesão ralado',
  //         '2 colheres de manteiga',
  //         'Noz-moscada a gosto',
  //       ],
  //       passos: [
  //         'Cozinhe a massa al dente.',
  //         'Derreta a manteiga em uma frigideira.',
  //         'Adicione o creme de leite e aqueça.',
  //         'Incorpore o queijo aos poucos.',
  //         'Misture a massa escorrida ao molho.',
  //         'Tempere com noz-moscada e sirva.',
  //       ],
  //     ),
  //   ],
  // ),
  // Categoria(
  //   id: 'c14',
  //   titulo: 'Bebidas',
  //   cor: Colors.cyan,
  //   descricao: 'Drinks, sucos e coquetéis especiais.',
  //   imagemUrl:
  //       'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=400',
  //   receitas: [
  //     Receita(
  //       id: 'r15',
  //       titulo: 'Mojito Tradicional',
  //       descricao: 'Coquetel cubano refrescante com hortelã e limão.',
  //       imagemUrl:
  //           'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=400',
  //       tempoPreparo: 10,
  //       dificuldade: Dificuldade.facil,
  //       ingredientes: [
  //         '50ml de rum branco',
  //         'Suco de 1 limão',
  //         '2 colheres de açúcar',
  //         'Folhas de hortelã',
  //         'Água com gás',
  //         'Gelo a gosto',
  //       ],
  //       passos: [
  //         'Amasse a hortelã com açúcar no copo.',
  //         'Adicione suco de limão e rum.',
  //         'Complete com gelo e água com gás.',
  //         'Mexa suavemente e decore.',
  //         'Sirva imediatamente.',
  //       ],
  //     ),
  //   ],
  // ),
  // Categoria(
  //   id: 'c15',
  //   titulo: 'Vegana',
  //   cor: Colors.lightGreen,
  //   descricao: 'Receitas 100% vegetais sem ingredientes de origem animal.',
  //   imagemUrl:
  //       'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400',
  //   receitas: [
  //     Receita(
  //       id: 'r16',
  //       titulo: 'Hambúrguer de Grão-de-Bico',
  //       descricao: 'Hambúrguer vegano nutritivo e saboroso.',
  //       imagemUrl:
  //           'https://images.unsplash.com/photo-1525059696034-4967a7290021?w=400',
  //       tempoPreparo: 35,
  //       dificuldade: Dificuldade.medio,
  //       ingredientes: [
  //         '2 xícaras de grão-de-bico cozido',
  //         '1 cebola média',
  //         '2 colheres de farinha de aveia',
  //         'Temperos a gosto (cominho, páprica)',
  //         'Azeite para grelhar',
  //       ],
  //       passos: [
  //         'Amasse o grão-de-bico com um garfo.',
  //         'Adicione cebola picada e temperos.',
  //         'Incorpore a farinha para ligar.',
  //         'Modele os hambúrgueres.',
  //         'Grelhe em azeite até dourar.',
  //         'Sirve em pão com salada.',
  //       ],
  //     ),
  //   ],
  // ),
];
