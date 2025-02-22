FROM weblate/weblate:4.14.1-1

USER 0

RUN pip3 install "weblate-odoo-component-generator @ git+https://github.com/acsone/weblate-odoo-component-generator@5c631eb7fd67c593941ed6f0b4629cf9f5f262d0"

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN python3 -m venv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install -U pip wheel setuptools && \
  /opt/oca-maintainer-tools/bin/pip install git+https://github.com/OCA/maintainer-tools@76f737e7499538f4a133325811088c1347aa28fb

COPY wocg-oca /usr/local/bin/

COPY weblate_customization /usr/src/weblate_customization
RUN pip install --no-cache-dir /usr/src/weblate_customization
ENV DJANGO_SETTINGS_MODULE=weblate_customization.settings

USER 1000

CMD ["runserver"]
