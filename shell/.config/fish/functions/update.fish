function update --description 'Get macOS Software Updates and update Homebrew, mas, and npm packages'
    sudo softwareupdate -i -a
    brew update
    brew upgrade
    brew upgrade --cask --greedy
    brew cleanup
    mas upgrade
    npm install npm -g
    npm update -g
end
