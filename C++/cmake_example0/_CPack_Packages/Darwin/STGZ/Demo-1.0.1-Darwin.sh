#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --prefix=dir      directory in which to install
  --include-subdir  include the Demo-1.0.1-Darwin subdirectory
  --exclude-subdir  exclude the Demo-1.0.1-Darwin subdirectory
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Demo Installer Version: 1.0.1, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage 
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version 
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
### License.txt


____cpack__here_doc____
    echo
    echo "Do you accept the license? [yN]: "
    read line leftover
    case ${line} in
      y* | Y*)
        cpack_license_accepted=TRUE;;
      *)
        echo "License not accepted. Exiting ..."
        exit 1;;
    esac
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Demo will be installed in:"
    echo "  \"${toplevel}/Demo-1.0.1-Darwin\""
    echo "Do you want to include the subdirectory Demo-1.0.1-Darwin?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Demo-1.0.1-Darwin"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

tail $use_new_tail_syntax +144 "$0" | gunzip | (cd "${toplevel}" && tar xf -) || cpack_echo_exit "Problem unpacking the Demo-1.0.1-Darwin"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;

� ��X �ZKlE���$rB�T=�W4mHiIe��E1��@^MR���d�]�+��hm�)R�JTʅ'n�c��=���{,� �āCafw����"�(�I�����o���<;�g+v�D,w%
G]� �B�D,�"��p� ���a�RY��)��~I�ڗ#�r�-xX?�r� C�T/w����?������c���&�v�(�|���󷿻 �� ,��.�t��� :����&	��䫩󩙩f�>ڡ<w$�3�zk�E}��Ӊm� K����/�kŚ��\>��;x��̫�ʕL�-���:t݌��Z���n.�v>����}[ڗ-�mú�ƾk�/��<|�*�_��5,V�؂�sƗ��Ft\����\�ːƵA�q�s�al���T�M�P���ɜ������cS݊Of|ݜ��y���t�`|l������`C?�+�H5ޮc��+G��&���KEg��|h�"t}���C�4���?�VX���p���KR�R�C��	iK��GO0;ޮ|�tz��~��_�|���^�{NzԻ�	�_��%m1N�^i�^jm��
*Ab��q�s�����g��$^�Ī88��Y���>�t�<�ΦW~J_�U�I�_������X�K��i��/�
^�f%u�ʽ`}������|%_��Z�[yc�B�n�+�V~�pks�S����O}DDrvs�*��yz�777Ӻi�E��`�.`Y��a=�S�n������Z�Z�$�/��4YkG��t��A/�)׾H�>�/�������������������������3T��}��uư4�gl�
l��^���#�����@.����W�c}Q�V�:��*�<Q5�0@��F��r?���w�[�wO-iN��4�o�ut����{�����գ�`�N�6ع�ߩ��g��6b�|�gM}�7��?���+͠�Cm ���h��/%��Eф���}A���J(�`J41+�H�R�7[q���^�� ���s��W����\j��zq�T�zu�ܥ�7��"J�u{�j��Z���L=����5.�ə7�pÛP��1���"���z��Ǆl��p���:)[,,�ٲ���G�|/F�u�K�-i_u��.�c=�s�Z�[�7���ݾ�x� �<_]��ťL���}��*.E���j?��?\k����f��(KroW���������+��k����8H�N�/�>���"�[�V֬h��� ?x�oD�#����?[�r��`~��m�������q����M���Φ�Ĺ��\:��Ѹp�FjfvljO$_���J�̱I����l����ݚ�_����D��2������E��������lA}G�^ �y\u�ֹ� Y��74$k��<娙�ϓ�D�4#C���u��-��AX :  