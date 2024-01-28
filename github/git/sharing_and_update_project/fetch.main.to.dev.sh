if [ "$#" -ne 2 ]; then
    echo "sh fetch.main.to.dev.sh <BASE BRANCH> <HEAD BRANCH>"
    echo "Required 2 parameter, but you give $# parameters"
    exit 1
fi


base_branch=$1
head_branch=$2

git fetch $base_branch..$head_branch > /dev/null