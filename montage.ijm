//フォルダ内のファイル一括処理
Dialog.create("montage")
Dialog.addMessage("最初にxy値を書き換えてください")
Dialog.show( )

//参照元（画像ファイル以外も開いてしまうので注意）
inputdirectory = getDirectory("参照元を指定してください");
Dialog.create("確認");
Dialog.addString("参照元", inputdirectory, 40);
Dialog.show( );
aaa = Dialog.getString();
//対象ファイル名を参照元ディレクトリから配列で取得
filelist = getFileList(inputdirectory);

//出力先
outputdirectory = getDirectory("出力先を指定してください");
Dialog.create("確認");
Dialog.addString("出力先", outputdirectory, 40);
Dialog.show( );
bbb = Dialog.getString();



//対象ファイル名を参照元ディレクトリから配列で取得
filelist = getFileList(inputdirectory);

//繰り返し処理
for (i=0; i<1; i++) {
//ファイルを開く
open(inputdirectory + "\\" + filelist[i]);
path = inputdirectory + "\\" + filelist[i];

//ここの下に適用したい処理を書く
run("Image Sequence...", "open=path sort");
run("Make Montage...", "columns=31 rows=55 scale=1");


//file_name = getInfo("image.filename");
file_name = filelist[i];
point = lastIndexOf(file_name, ".");
file_name = substring(file_name, 0, point);
run("Flip Vertically");
saveAs("Tiff", bbb+"\\"+file_name+"Montage.tif");