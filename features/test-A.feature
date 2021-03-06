Feature: DNF/Behave test (install remove test)

Scenario: Install TestA from repository "test-1"
 Given I use the repository "test-1"
 When I "install" a package "TestA" with "dnf"
 Then package "TestA, TestB" should be "installed"
 And package "TestC" should be "absent"
 When I "install" a package "TestA" with "dnf"
 Then package "TestA, TestB" should be "present"
 When I "remove" a package "TestA" with "dnf"
 Then package "TestA, TestB" should be "removed"
 And package "TestC" should be "absent"

 When I "install" a package "TestD" with "dnf"
 Then package "TestD, TestE" should be "installed"
 When I "remove" a package "TestD" with "dnf"
 Then package "TestD, TestE" should be "removed"

 When I "install" a package "TestF" with "dnf"
 Then package "TestF, TestG, TestH" should be "installed"
 When I "remove" a package "TestF" with "dnf"
 Then package "TestF, TestG, TestH" should be "removed"

 When I execute command "dnf install -y TestI" with "fail"
 Then package "TestI, TestJ" should be "absent"

 When I "install" a package "TestK, TestL" with "dnf"
 Then package "TestK, TestL, TestM" should be "installed"
 When I "remove" a package "TestK" with "dnf"
 Then package "TestK" should be "removed"
 And package "TestL, TestM" should be "present"
 And package "TestL, TestM" should be "unupgraded"
 When I "remove" a package "TestL" with "dnf"
 Then package "TestL, TestM" should be "removed"
