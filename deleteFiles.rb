$skipFile1 = "AuthorizationObjects.json"
$skipFile2 = "%DefaultAgent.json"
$skipFile3 = "SystemSettings.json"

def deleteFiles(path)
  Dir::foreach(path) do |f|
    fn = File.join(path,f)
    deleteFiles(fn) if f != '.' && f != '..' && File::directory?(fn)

    File::delete(fn) if f != '.' && f != '..' && f != $skipFile1 && f != $skipFile2 && f != $skipFile3 && !File::directory?(fn)
  end
end

mainDir = "C:\\SAPDevelop\\CSFxM\\ConnectivityServices\\dev\\src\\_connectivityFramework\\sln\\Deploy\\System\\PData\\Config"
deleteFiles(mainDir)
