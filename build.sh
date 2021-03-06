if [ ${TRAVIS_PULL_REQUEST} = 'false' ] && [ ${TRAVIS_BRANCH} = 'master' ]; then
      echo 'Build and deploy master branch'
      mvn --batch-mode clean install org.sonarsource.scanner.maven:sonar-maven-plugin:3.0.1:sonar -Dsonar.host.url=${SONAR_URL} -Dsonar.login=${SONAR_LOGIN} --settings ./settings.xml;
elif [ ${TRAVIS_PULL_REQUEST} = 'false' ] && [ ${TRAVIS_BRANCH} = 'snapshot' ]; then
      echo 'Build snapshot branch'
      mvn --batch-mode clean verify;
elif [ ${TRAVIS_PULL_REQUEST} != 'false' ]; then
      echo 'Only build and analyze pull request'
      mvn --batch-mode clean verify org.sonarsource.scanner.maven:sonar-maven-plugin:3.0.1:sonar -Dsonar.analysis.mode=issues -Dsonar.host.url=${SONAR_URL} -Dsonar.login=${SONAR_LOGIN} -Dsonar.github.oauth=${SONAR_GITHUB_OAUTH} -Dsonar.github.repository=talan-labs/toast-tk-selenium-plugin -Dsonar.github.pullRequest=${TRAVIS_PULL_REQUEST};
fi