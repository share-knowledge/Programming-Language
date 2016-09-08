package test

import (
	"fmt"
	"reflect"

	"testing"
)

func ConvertValue(v interface{}) (Value, error) {
	rv := reflect.ValueOf(v)
	switch rv.Kind() {
	case reflect.Int, reflect.Int8, reflect.Int16, reflect.Int32, reflect.Int64:
		i64 := rv.Int()
		if i64 > (1<<31)-1 || i64 < -(1<<31) {
			return nil, fmt.Errorf("sql/driver: value %d overflows int32", v)
		}
		return i64, nil
	}

	return nil, nil
}

func Test_time(t *testing.T) {
	a := 101

	v, err := ConvertValue(101)

	fmt.Printf("%+v %+v \n", v, err)

}
