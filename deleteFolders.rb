$folderBin = "bin"
$folderObj = "obj"

def deleteAllFiles(path)
  Dir::foreach(path) do |file|
    f = File.join(path,file)
    next if file == '.' || file == '..'

    if !File::directory? f
      File::delete f
    else
      deleteAllFiles f
      Dir::delete f
    end
  end
end

def deleteFolders(path)
  if(path.empty?)
    return;
  end
  Dir::foreach(path) do |dir|
    f = File.join(path,dir)
    next if dir == '.' || dir == '..'
    next if !File::directory? f

    if(dir == $folderBin || dir == $folderObj)
      deleteAllFiles f
      Dir::delete f
      puts f
    else
      deleteFolders f
    end
  end
end

puts 'Deleting...'

mainDir = "C:\\SAPDevelop\\CSFxM\\ConnectivityServices\\dev\\src\\_connectivityFramework\\sln\\MMA"
deleteFolders(mainDir)

puts 'Deleting finished...'