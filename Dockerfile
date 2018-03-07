FROM node:latest

WORKDIR saml-idp
RUN git clone --single-branch -b develop/git_docker \
  https://github.com/StudistCorporation/saml-idp.git .

RUN npm install -g bower
RUN npm install
RUN bower install --allow-root

EXPOSE 7000 7000

ENTRYPOINT [ "node",  "app.js" ]
CMD ["--acs", "http://localhost:3000/saml/consume", "--aud", "http://localhost:3000/saml/entity/30"]
