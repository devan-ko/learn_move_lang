module sui_move_by_example_entry_func::entry_func_example {
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;

    struct Object has key {
        id: UID,

    }

    public fun create (ctx: &mut TxContext): Object {
        Object {id :object::new(ctx)}
    }
    // what is difference using public keyword to entry function?
    entry fun create_and_transfer (to: address, ctx: &mut TxContext) {
        let obj = create(ctx);
        transfer::transfer(obj,to);
    }
}