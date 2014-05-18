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
if fs.exists("login/") ~= true then
  if fs.makeDir("login") then
    print("login dir created.")
  end
end
if fs.exists("login/name.dat") ~= true then
  term.setTextColor(colors.yellow)
  print("Set up an account first")
  term.setTextColor(colors.white)
  function enterName()
    print("Enter username:")
    name = read()
    if name == "" or name == nil then
      enterName()
    else
      if kit.save(name, "login/name.dat", "w") then
      end
    end
  end
  enterName()
end
if fs.exists("login/pass.dat") ~= true then
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
      if kit.save(hash[1], "login/salt.dat", "w") then
        print("Salt saved!")
      end
      if kit.save(hash[2], "login/pass.dat", "w") then
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
  if user ~= kit.load("login/name.dat") then
    print("Password:")
    read("*")
    print("Wrong login!")
    print("Press enter...")
    read(" ")
    login()
  end
  print("Password:")
  pass = read("*")
  if pass == "" or pass == nil then
    login()
  end
  salt = kit.load("login/salt.dat")
  if salt == "" or salt == nil then
    error("Something went wrong loading salt file")
  end
  hashpass = kit.load("http://lesander/tools/sha.php?s="..pass.."&n="..salt, true)
  if hashpass == "" or hashpass == nil then
    error("Something went wrong loading sha file")
  end
  if hashpass[2] == kit.load("login/pass.dat") then
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
name = kit.load("login/name.dat")
print("Welcome back, "..name.."!")
  