+++
title = "+Python"
+++

## Overview
### Pluses
- Program portability: Often compiled to bytecode, which is then interpreted into machine leanguage instructions.
- Compared to C or Java, 1/3 to 1/5 code requried. Thence, higher productivity, software quality.
- Good libraries. Can easily interact with C or Java code, and even extend classes specified there.
- Garbage collection.

#### Syntax conciseness
Clean and concise syntax: compare to perl; so more readable. As a general rule, python tries to use the same operators and function names for similar operations over different types of operands: Eg: +, len, dir.

### Negatives
- Difficult thread safety. Hence the global interpreter lock (GIL).
- No type safety. Must rely on assertions to avoid producing garbage in database etc..
- Speed - An interpreted language. Speed is many times slower than C or Java. For vector operations, speed comparable with Matlab; but for looping, may be faster.

## Writing, Building and executing code
Make .py files; begin with \verb'#!/usr/bin/python'.

### Important env variables
PYTHONHOME: location of the std libraries.

PYTHONPATH: default search path for modules/ package libraries, may refer to zipfiles containing pure Python modules (in either source or compiled form).

PYTHONSTARTUP.

### Linting
Python is an interpreted language - so many silly errors which would have been caught by a compiler are noticed only at run-time, if at all that code is run. So, Linting (and testings) is especially important.

#### Pylint commands
In code, one can say:
\# pylint: disable-msg=W0613

### Point of entry
Can use interpreter. Or first line in file.py.

"python -c command [arg] ...", "python -m module [arg] ...", which executes the source file for module

#### Arguments
sys.argv, a list of strings has the script name and additional arguments from shell; an empty string if no argument is given.

### Installing External libraries
Place a link in the site-packages directory.

Or run python setup.py build, python setup.py install.

Or do: sudo pip install pkgName or easy\_install pkgName.

## Help
help(object/ module)

## General
<div class="spreadsheet" fullHeight src="general.toml"> </div>  



## Strings
<div class="spreadsheet" fullHeight src="string.toml"> </div>  

## Regex
<div class="spreadsheet" fullHeight src="regex.toml"> </div>  



## Collection
<div class="spreadsheet" fullHeight src="collection.toml"> </div>  

## Test
<div class="spreadsheet" fullHeight src="test.toml"> </div>  



## Interfacing with other languages, the OS
### Numeric programming
numpy.

### RPy or RPy2 for R
No easy plotting in sage.\\
 from rpy import *. r.library ("..",  \verb'lib_loc =os.path.join(lib_path, "R"))'.

### With Matlab
In sage use 'matlab.eval()'.

```
X = scipy.io.loadmat('mydata.mat'), scipy.io.savemat().
```

### C extension
#### Function signatures
```
static PyObject *MyFunction( PyObject *self, PyObject *args );

static PyObject *MyFunctionWithKeywords(PyObject *self,
                                 PyObject *args,
                                 PyObject *kw);

static PyObject *MyFunctionWithNoArgs( PyObject *self );
```

#### Function
```
#include <Python.h>

static PyObject* helloworld(PyObject* self)
{
    return Py_BuildValue(""s"", ""Hello, Python extensions!!"");
}

static char helloworld_docs[] =
    ""helloworld( ): Any message you want to put here!!\n"";

static PyMethodDef helloworld_funcs[] = {
    {""helloworld"", (PyCFunction)helloworld, 
     METH_NOARGS, helloworld_docs},
    {NULL}
};

void inithelloworld(void)
{
    Py_InitModule3(""helloworld"", helloworld_funcs,
                   ""Extension module example!"");
}
```

#### Setup.py installation
```
from distutils.core import setup, Extension
setup(name='helloworld', version='1.0',  \
      ext_modules=[Extension('helloworld', ['hello.c'])])
```

`$ python setup.py install`

#### Import and use
```
#!/usr/bin/python
import helloworld

print helloworld.helloworld()
```

```
PyObject* result = ....

  for (int i = 0; i < PyList_Size(result); i++) {
    string query;
    PyObject* item = PyList_GetItem(result, i);
    if (!PythonUtils::CPPString_FromPyString(item, &query)) {
      continue;
    }
    queries->push_back(query);
  }
```

## Math
### Pandas
<div class="spreadsheet" fullHeight src="pandas.toml"> </div>  

### Numpy
#### Array
##### Create
``` 
x = np.array([2,3,1,0])
np.zeros((2, 3)) # array([[ 0., 0., 0.], [ 0., 0., 0.]])
ones(shape)
np.arange(10) # array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
x = np.full(3, np.nan)
```

#### Index
``` x = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
>>> x[1:7:2]
array([1, 3, 5])
>>> x[-2:10]
array([8, 9])
```
#### Concatenate
```>>> a = np.array([[1, 2], [3, 4]])
>>> b = np.array([[5, 6]])
>>> np.concatenate((a, b), axis=0)
array([[1, 2],
       [3, 4],
       [5, 6]])
>>> np.concatenate((a, b.T), axis=1)
array([[1, 2, 5],
       [3, 4, 6]])
```

#### Sklearn
```
import numpy as np
from sklearn.metrics import precision_recall_curve
y_true = np.array([0, 0, 1, 1])
y_scores = np.array([0.1, 0.4, 0.35, 0.8])
precision, recall, thresholds = precision_recall_curve(y_true, y_scores)
```

### matplotlib.pyplot
```

import matplotlib.pyplot as plt# setup plot details
colors = cycle(['navy', 'turquoise', 'darkorange', 'cornflowerblue', 'teal'])
lw = 2
# Plot Precision-Recall curve
plt.clf()
plt.plot(recall[0], precision[0], lw=lw, color='navy',
         label='Precision-Recall curve')
plt.xlabel('Recall')
plt.ylabel('Precision')
plt.ylim([0.0, 1.05])
plt.xlim([0.0, 1.0])
plt.title('Precision-Recall example: AUC={0:0.2f}'.format(average_precision[0]))
plt.legend(loc="lower left")
plt.show()

```



## Selenium browser driver
### Wait
Implicitly wait for element to be loaded: `browser.implicitly_wait(2)`

#### Explicit

```
element = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.ID, "myDynamicElement"))
    )

def detail_elements_ready(browser):
    elements = browser.find_elements_by_css_selector(".detailbox")   # Finding the referenced element
    for element in elements:
        if "શોધી રહ્યા છે" in element.text:
            return False
    return True
wait = WebDriverWait(driver, 10)
element = wait.until(detail_elements_ready)
```

Events supported:  
title_is title_contains presence_of_element_located visibility_of_element_located visibility_of presence_of_all_elements_located text_to_be_present_in_element text_to_be_present_in_element_value frame_to_be_available_and_switch_to_it invisibility_of_element_located element_to_be_clickable staleness_of element_to_be_selected element_located_to_be_selected element_selection_state_to_be element_located_selection_state_to_be alert_is_present

#### Ref
<div class="spreadsheet" fullHeight src="selenium.toml"> </div>  

## IO
<div class="spreadsheet" fullHeight src="io.toml"> </div>  


### DB
#### Serialization
<div class="spreadsheet" fullHeight src="serialization.toml"> </div>  


#### Couchdb
<div class="spreadsheet" fullHeight src="couchdb.toml"> </div>  

#### Pymongo
<div class="spreadsheet" fullHeight src="pymongo.toml"> </div>  

