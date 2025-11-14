#include "context.h"
#include "assert.h"
#include "stdlib.h"
#include "string.h"

__generator __main_gen;
__generator* __now_gen = &__main_gen;

// Task 2

void __err_stk_push(__ctx* ctx) {
    assert(ctx != 0);

    __err_stk_node* node = (__err_stk_node*)malloc(sizeof(__err_stk_node));
    assert(node != 0);

    node->ctx = ctx;                           // 保存上下文指针
    node->prev = __now_gen->__err_stk_head;    // 指向旧栈顶
    __now_gen->__err_stk_head = node;          // 更新栈顶
}

__ctx* __err_stk_pop() {
    assert(__now_gen->__err_stk_head != 0);

    __err_stk_node* node = __now_gen->__err_stk_head;
    __ctx* ret = node->ctx;                    // 取出栈顶 ctx 指针
    __now_gen->__err_stk_head = node->prev;    // 栈顶指向前一个节点
    free(node);                                // 释放节点

    return ret;
}


void __err_cleanup(const int* error){
    if(!*error) __err_stk_pop();
}

int __check_err_stk(){
    return __now_gen->__err_stk_head == 0;
}

int send(__generator* gen, int value) {
    if (gen == 0) throw(ERR_GENNIL);
    gen->data = value;
    gen->caller=__now_gen;
    int is_restore = __ctx_save(&__now_gen->ctx);
    if(!is_restore){
        __now_gen=gen;
        __ctx_restore(&gen->ctx, 1);
    }
    return gen->data;
}

int yield(int value) {
    if (__now_gen->caller == 0) throw(ERR_GENNIL);
    __now_gen->data = value;
    int is_restore =__ctx_save(&__now_gen->ctx);
    if(!is_restore){
        __now_gen=__now_gen->caller;
        __ctx_restore(&__now_gen->ctx, 1);
    }
    return __now_gen->data;
}

void back_to_reality() {
    throw(ERR_GENEND);
}

// Task 3

__generator* generator(void (*f)(int), int arg) {
    __generator * new_gen = (__generator *) malloc(sizeof(__generator));
    size_t size = 8192;
    new_gen->f = f;
    new_gen->stack = malloc(size);
    new_gen->__err_stk_head = NULL;
    long long* ctx_addr = (void*)&new_gen->ctx;
    long long* stack_addr = (void*)new_gen->stack;
    // TODO: Construct a new generator's context

    // Things you may do:
    // 1. Set stack pointer $rsp
    // 2. Set return position on the stack top or in context
    // 3. Set argument $rdi 不是rsi!!!
    // 4. Set stack base pointer $rbp (optional)
    // 5. Set the function f into context (optional)
    // 6. Set other registers if needed

    // Example: (It depends on your own context structure)
    // ctx_addr[0] = (long long)((char*)new_gen->stack + size - 16); //stack pointer
    // ctx_addr[5] = arg; //rsi
    // ctx_addr[6] = (long long)((char*)gen->stack + size); //rbp
    // ctx_addr[1] = (long long)((void*)back_to_reality); //return position in context 
    // stack_addr[size / 8 - 1] = (void *)back_to_reality; //or return position on stack
 
    // 初始化 ctx
    ctx_addr[0] = 0;
    ctx_addr[1] = 0;
    ctx_addr[2] = 0;
    ctx_addr[3] = 0;
    ctx_addr[4] = 0;
    ctx_addr[5] = (long long)((char*)new_gen->stack + size);   // rbp
    ctx_addr[6] = (long long)((char*)new_gen->stack + size - 8);     // rsp
    ctx_addr[7] = (long long)f;                     // rip
    ctx_addr[8] = arg;                              // rdi

    // 初始化 stack
    stack_addr[size / 8 - 1] = (long long)back_to_reality;

    return new_gen;
}

void generator_free(__generator** gen) {
    if (*gen == NULL) throw(ERR_GENNIL);
    free((*gen)->stack);
    while ((*gen)->__err_stk_head != 0) {
        __err_stk_node* tmp = (*gen)->__err_stk_head;
        (*gen)->__err_stk_head = (*gen)->__err_stk_head->prev;
        free(tmp->ctx);
        free(tmp);
    }
    free(*gen);
    *gen = NULL;
}