
final List<ProductData> productDatas = [
  ProductData(imagePath: 'images/header_1.jpeg',name: 'CBD Hand Cream',description: 'CBDAYSのCBD(150mg)配合 CBDHandCream は日本正規品のCBD150mg含有コスメです。オーガニックなブロードスペクトラムCBDに天然成分のラベンダーなどを配合し、カンナビジオールが体内のカンナビノイドに働きかけます。いい香りのボディクリームは肌に塗るだけでシアバターが保湿してくれます。スキンケアとして、軟膏として使えるヴィーガンスキンクリームです。',price: 2980),
  ProductData(imagePath: 'images/header_2.jpeg',name: 'CBD OIL',description: 'CBDAYSオイルの特徴は、 MCTオイルをベースに作られているところ。ココナッツなどに含まれている中鎖脂肪酸だけを抽出したオイルで無味・無臭。料理にプラスしたり、ドリンクに入れて飲むこともできます。種類はアイソレートでTHCは含まれていません。容量は30mlで、CBD含有量は1000mg。このほかCBD含有量500mg、2000mgもあります。', price: 4980),
  ProductData(imagePath: 'images/header_1.jpeg',name: 'CBD Vape', description: 'CBD入り電子タバコ・VAPE用リキッドです。内容量10mlに対し、CBD500mgを含有していますので、CBD濃度は5.0％となります。こちらのプレミアムブラックは、CBD以外にCBDV、CBDA、CBG等のカンナビノイドを含み、単体のCBDよりも相乗効果が期待できるフルスペクトラム仕様です。',price: 4980),
];

class ProductData {
  final String imagePath;
  final String name;
  final double price;
  final String description;
  ProductData({required this.imagePath,required this.name,required this.description,required this.price});
}