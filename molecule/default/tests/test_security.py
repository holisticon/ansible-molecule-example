import os
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_webserver_connected_via_localhost(host):

    scks = host.socket("tcp://127.0.0.1:80")
    assert scks.is_listening
