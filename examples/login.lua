-- Super Secure Protection
-- By Alex. Copyright AxTo Inc. 2014
-- Made for/with ComputerCraft 1.5 and Kit
-- Get kit at http://git.io/kitdocs

-- Protect your file:
-- os.loadAPI("login.lua")

-- Run 'login reset' to reset your login.

os.loadAPI("kit")
kit.clear(term)
os.pullEvent = os.pullEventRaw
if fs.exists("name.dat") ~= true then
  term.setTextColor(colors.yellow)
  print("Set up an account first")
  term.setTextColor(colors.white)
  function enterName()
    print("Enter username:")
    name = read()
    if name == "" or name == nil then
      enterName()
    else
      if kit.save(name, "name.dat", "w") then
      end
    end
  end
  enterName()
end
if fs.exists("pass.dat") ~= true then
  function enterPass()
    print("Create password for "..name..":")
    pass = read()
    if pass == "" or pass == nil then
      enterPass()
    else
      hash = kit.load("http://lesander.nl/tools/sha.php?s="..pass, true)
      if hash == "" or hash == nil then
        error("Something went wrong loading sha file.")
      end
      if kit.save(hash, "pass.dat", "w") then
        print("Account created!")
        print("Press enter to continue ...")
        read(" ")
      end
    end
  end
  enterPass()
end
function login()
  kit.clear(term)
  term.setTextColor(colors.yellow)
  print("This file is protected")
  term.setTextColor(colors.white)
  print("Username:")
  user = read()
  if user ~= kit.load("name.dat") then
    print("Unknown Username.")
    print("Press enter...")
    read(" ")
    login()
  end
  print("Password:")
  pass = read("*")
  if pass == "" or pass == nil then
    login()
  end
  hashpass = kit.load("http://lesander/tools/sha.php?s="..pass, true)
  if hashpass == "" or hashpass == nil then
    error("Something went wrong loading sha file")
  end
  if hashpass == kit.load("pass.dat") then
    return true
  else
    print("Wrong login!")
    print("Press enter...")
    read(" ")
    login()
  end
end
login()

arg = { ... }
if arg[1] == "reset" then
  shell.run("rm", "name.dat")
  shell.run("rm", "pass.dat")
  print("Account was reset.")
  print("Press enter...")
  read()
  os.reboot()
end

kit.clear(term)
name = kit.load("name.dat")
print("Welcome back, "..name.."!")
  