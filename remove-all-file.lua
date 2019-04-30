-- list file
allFiles = file.list();
for k,v in pairs(allFiles) do
    if (string.find(k, "init.lua" ) ~= nil and string.find(k, "remove-all-file.lua") ~= nil) then
        print("remove name:"..k..", size:"..v)
        file.remove(k)
    end
end
