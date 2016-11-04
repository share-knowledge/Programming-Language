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

� }�X �ZKlE���$rB�T=�W4mHiIe�_���$Z�L��u�b���vIP�"U�A�\8p�8�Xq��"��c� 
H8Dfvg��+i+�2�4��ߙ�柝�ǳ3ưB`�!IR<����RR"���rX�b�h\�G�$+aY0�ۆTJe�Ʀ���e�j_������}���^(�fۏ�"E���Ecq<�aY�(��Q����ow �X�a]�� ���?�S'����.�f��9��h����\ꭹ�ņ
TǶ�C4ǎ��X�k��s�4F�`y;�2�"T*W2��|��l�=tS��j}򺹠�-�LZ�qF�mk_�T��R��S����ի�~�zװ4dX�b�[�/��,ȸ�;<��\��ƵA�q�3�!d���T�M�P����g���g�!SݎO�|݌��y���t�`|l��Tr�{f����Ǆk�	�g-G������KEf�Q�|H�"t}��߃�4���?�VX��@q��ދS�R�C��	iK��GOP;ޮ|�4�6�Ç�_���3�����������|
���_�{Iڑ(�c��H.��q�� 6��8凙�B�����Kx/_�U���,@�y��:y���+?���*�&�/b��Uj�d�+���1�b�9Y��_��6>�l��CT�ce-}�K���*����+\t�_�X��❭�O���o<��٭�kX����_~���J�Y�omS�9�X�eN������˺]2��ԎH5bѓ��t��x�n�麛�&����X�"i�t��w������yd�������t���*��#�h�6�rk����P���G�����u��UR1x!�j�a�8ٍ���~|��ﴷ��Z��>�i�������!�!����O���G����m�s�Q�S!���mD��^Ϛ�~`@�L#3W,�Au�ڐ$)������M�_)�������T;�10 �	� G�Ê"G"
�QI�w�l�KU�������'��W����\*Ix��
r�O����I{�M�Ia9޺�X���@A-V��f�l����dN��M(����f�s�ʻB���cBv�C�8��m��-�lً�A�I6ߋ�� �kK�Wݯ��@Hϣ�����S9Je��>ޥ�<�W�jq)Ӵ�y�;���K���)��Og�֚ -�� ,����ս*�� ��m��ʁ�a���G:\����,����������5+���1���ca����?[�rƥ`~����%Y�5��FbR����4=gX:<7�B�'s�@��G�����ٱ�I4�xmj�m2�&q���gÃ����T��,������G�1%B�?&I��{�#�?xs0[P�ѽ 9oCU��un ����mA���#�8j���x"�-���P�-��}�� �I< :  