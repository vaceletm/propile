# encoding: utf-8

class Persona

  public
  
  attr_reader :name, :short_description, :long_description
  attr_reader :image

  def initialize(name,short_description,long_description)
    @name = name
    @image = "/personas/#{name.downcase}.jpg"
    @short_description = short_description
    @long_description = long_description
  end

  ALL = {}
#   ALL = { "jan" =>
#       Persona.new("Jan",
#       "Jan est un programmeur expérimenté. Il vient à Agile France pour échanger des trucs et astuces avec des experts et se tenir au courant des dernières tendances en matière d'intégration continue et des tests automatisés.",
#       "Jan travaille en tant que programmeur depuis 5 ans maintenant. Jan aime programmer. Il connaît beaucoup de langages et d'outils. Au travail, il est parfois malheureux parce qu'il se trouve obligé à fournir un travail moins bon que ce dont il se sait capabable. Jan explore les nouvelles technologies et les dernières tendances sur Internet, dans les livres et les magazines. La nuit, Jan contribue à un projet open source avec 10 autres personnes d'un peu partout dans le monde. C'est là qu'il a entendu parler de méthodes agiles. Dans le groupe open source, il a l'habitude de travailler avec des tests unitaires, mais il espère obtenir quelques conseils et astuces en profondeur réels des experts lors de la conférence XP Days. Il s'intéresse également à en apprendre davantage sur les dernières tendances pour les outils de l'Intégration continue et l'automatisation des tests."),

#     "marieke" =>
#       Persona.new("Marieke",
#       "Marieke fait partie d'une équipe qui produit régulièrement des logiciels et a commencé à utiliser des techniques agiles. Elle trouve qu'elles ne fonctionne pas très bien dans son cas. Elle espère échanger avec des gens du terrain qui puissent lui dire comment ils s'y sont pris dans de vraies équipes, les problèmes qu'ils ont rencontrés, et qu'est-ce que cela a entrainé comme conséquences pour eux.",
#       "Marieke fait partie d'une équipe qui produit régulièrement des logiciels . Il y a quelques mois, son équipe a reçu une formation d'initiation à extreme programming et scrum. Certains des concepts présentés l'ont intéressée, mais elle n'est pas convaincue que cette méthodologie s'applique dans son cas particulier. Après la formation, certains de ses collègues se sont mis à écrire des tests unitaires, mais il y en a très peu pour l'instant, et pour autant que Marieke puisse en juger, ils ne sont pas exécutés très souven. L'équipe a aussi mis en place un stand up meeting quotidien. D'après le formateur, cet outil devrait permettre d'améliorer la communication au sein de l'équipe. En fait, ça fait surtout une réunion assez ennuyeuse de plus, qui consomme 1/2h chaque jour. Les membres de l'équipe commencent à se plaindre de la perte de temps.\n
# Marieke commencent à croire que toutes ces histoires agiles ne sont qu'une mode survendue et inutilisable. Quand elle a entendu parler d'Agile France elle s'est \"laissons une dernière chance, si 200 personnes assistent à cette conférence depuis 8 ans, c'est peut-être qu'il y a autre chose dernière\". Elle espère échanger avec des gens du terrain qui puissent lui dire comment ils s'y sont pris dans de vraies équipes, les problèmes qu'ils ont rencontrés, et qu'est-ce que cela a entrainé comme conséquences pour eux."),

#     "leo" =>
#       Persona.new("Leo",
#       "Leo has been around forever. He has seen everything, done everything. He wants to go to XP Days because he thinks it's an excellent opportunity to meet with a lot of young, smart and enthusiastic  people.",
#       "Leo has been around forever. He has seen everything, done everything. Over the years, Leo has been working as a developer, as a project lead, as a tester, as an analyst, as a manager, and as a consultant. He knows from experience that everything comes back, if you only wait a few years. He has learned that the same problems and the same solutions have been invented and re-invented a hundred times in computer science. He has lived through the rise and fall of uncountable new technologies and methodogies. All of them brand new, all of them the one and only forever best way to make software. Leo wants to go to XP Days because he thinks it's an excellent opportunity to meet with a lot of young, smart and enthusiastic  people."),

#     "bram" =>
#       Persona.new("Bram",
#       "Bram has never missed an XP Day. Bram likes he XP Days because of the friendly and informal atmosphere. Every year he goes back to work from XP Days full of energy, with a bag full of new ideas and techniques.",
#       "Bram has never missed an XP Day. Well, to be correct, he has never missed a Benelux XP Day. He has been to several other XP Days in Germany, London, Paris, and in Italy, and also attended quite a few bigger agile and other conferences. Bram likes he XP Days, because of the friendly and informal atmosphere. Every year he goes back to work from XP Days full of energy, with a bag full of new ideas and techniques."),

#     "philippe" =>
#       Persona.new("Philippe",
#       "Philippe comes to XP Days because his boss told him to go. He doesn't really care, because going to this conference means that he will be away from the hectic chaos in the office for 2 days.",
#       "Philippe comes to XP Days because his boss told him to go. He has never heard about this agile stuff. He doesn't know what it is, or what it can be used for. He guesses it is something his boss wants to buy. He doesn't really care, because going to this conference means that he will be away from the hectic chaos in the office for 2 days.
# \n
# mmm I think maybe it is not very useful for Philippe to come to the XP Days?  -Vera\n
# \n
# Why not? Let Philippe come, let him relax and have a beer and dinner with agile people. He might even attend some presentations. And, once he's relaxed, who knows what could happen? --Pascal"),

#     "georges" =>
#       Persona.new("Georges",
#       "Georges is a stressed project manager. He's heard that agile projects are more effective, more fun and rewarding.  He doubts if everything he's heard is true. But what if it is...?",
#       "Georges is a project manager. His life is filled with stress, deadlines, difficult programmers, unhappy customers and demanding bosses. Sometimes he wonders if he's chosen the right career.
# \n
# Lately, Georges has been hearing more and more about agile methods. Some of his ex-colleagues have converted from project management to agile coaching. They tell him tales of vibrant, exciting, fun projects where customers and developers live in perfect harmony. That can't be true. They must be exaggerating. Or are they....?"),

#     "vincent" =>
#       Persona.new("Vincent",
#       "Vincent is the IT manager of a large company. The CEO has asked him to propose a plan to increase the efficiency of his department by 10%  in the next two years. He comes to the XP Days to get a taste of what \"agile\" can offer him. ",
#       "Vincent is the IT manager of a large company. His teams don't do too badly. Some projects are allright; some don't fully satisfy their users. The CEO has asked him to propose a plan to increase the efficiency of his department by 10%  in the next two years. So, Vincent looks around for solutions that might help him to create and implement the plan. He has looked at a lot of things: processes, tools, consultants... He's heard that some other companies (even some reputable companies) have had success with \"agile\" methods, so he comes to the XP Day to get a taste of what \"agile\" can offer him. He doesn't know what to expect. Hippy surfer dudes? 18 year old wizz kids with piercings? Greybearded hackers? Oh well... What does he have to lose?"),

#     "joke" =>
#       Persona.new("Joke",
#       "Joke is a product manager for a succesful product company. Joke finds it hard to talk to the development team, to make them understand what she needs in the product. Joke hopes to meet some developers and other product managers who can help her and give her some tips.",
#       "Joke is a product manager for a succesful product company. Joke understands her customers needs, she has lots of ideas for new features that would enhance the product. She knows that this product really enhances its user's lives. That's one of the reasons her company is so succesful. But they have trouble keeping up with customer demand. Joke finds it hard to talk to the development team, to make them understand what she needs in the product. If only she and the development team could work together more efficiently, they could make this product make more of a difference. Maybe this \"agile\" stuff can help? How does product management work in agile projects? Joke hopes to meet some developers and other product managers who can help her and give her some tips."),

#     "hank" =>
#       Persona.new("Hank",
#       "Hank is a motivated and experienced software engineer cum system architect who spends his days knee deep in the quagmires of enterprise automation. He comes to the XP-days to share with and learn from like-minded colleagues. ",
#       "Hank is a motivated and experienced software engineer cum system architect who spends his days knee deep in the quagmires of enterprise automation. Appalled and bemused by the shocking waste of time, money, and people, he does his best to bring the joy back in the life of those around him by introducing agile methodologies wherever he sees the opportunity. Hank comes to the XP-days to share with and learn from like-minded colleagues. "),

#     "ellen" =>
#       Persona.new("Ellen",
#       "Ellen is an agile coach. She wants to learn and share new ideas and experience of techniques that work. She comes to XP Days Benelux because of its friendly and collaborative atmosphere.",
#       "Ellen is an agile coach. She's been using agile methods for a few years now. XP, SCRUM, Lean... it doesn't matter much to her. She's more interested in doing things that matter to deliver value for her customers. She wants to work with a happy team, doing meaningful work.\n
# Ellen wants to learn new ideas and share experience of techniques that work. She comes to XP Days Benelux because of its friendly and collaborative atmosphere."),
#   }

  def Persona.all
    ALL
  end
  
  def Persona.called(name)
    ALL[name.downcase]
  end

  def Persona.all_personas
    ALL.values
  end

  def Persona.mentioned_in(description)
    return [] if description.nil?
    return all_personas if description =~ /\banyone\b/i
    return all_personas if description =~ /\banybody\b/i
    return all_personas if description =~ /\beverybody\b/i
    return all_personas if description =~ /\beveryone\b/i
    description = description.downcase
    personas = []
    ALL.each do |name,persona|
      personas << persona if description.include? name
    end
    personas
  end
end
