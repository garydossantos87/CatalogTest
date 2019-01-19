if ! type "twine" > /dev/null; then
  # install foobar here
  echo "You must install Twine to continue ([sudo] gem install twine)"
  exit 1
fi
git submodule update --init --remote external
twine generate-all-localization-files external/strings.txt CatalogTest/Commons/Resources/Translations/ --tags ios
