"""
This provides an Ansible script to easily format database privileges.
"""


def as_database_privilege(databases: list[str], privilege: str) -> dict[str, str]:
    return {f"{database}.*": privilege for database in databases}


class FilterModule(object):
    """
    Ansible filter for generating MySQL `privs` list.
    """

    def filters(self):
        return {
            "as_database_privilege": as_database_privilege,
        }
