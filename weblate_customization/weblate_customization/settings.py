# Copyright © Jose Zambudio <jose@aurestic.es>

from weblate.settings_docker import *


DEFAULT_ADDONS = {
    "weblate.git.squash": {
        "squash": "all",
        "append_trailers": True,
        "commit_message": "",
    },
    "weblate.gettext.msgmerge": {
        "previous": True,
        "no_location": False,
        "fuzzy": True,
    },
    "weblate.autotranslate.autotranslate": {
        "mode": "suggest",
        "filter_type": "todo",
        "auto_source": "others",
        "component": "",
        "engines": ["weblate-translation-memory"],
        "threshold": "80",
    },
}
