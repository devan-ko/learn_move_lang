module my_first_package::my_module {

    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    

    struct Sword has key, store {
        id: UID,
        magic: u64,
        strength: u64,
    }

    struct Forge has key, store {
        id: UID,
        sword_created: u64,
    }
    //  Module initializer to be executed when this module is published
    fun init(ctx: &mut TxContext) {
        let admin = Forge {
            id: object::new(ctx),
            sword_created: 0,
        };
        transfer::transfer(admin, tx_context::sender(ctx));
    }

    
    //  Accessors required to read the struct attributes
    public fun magic(self: &Sword): u64 {
        self.magic
    }

    public fun strength(self: &Sword): u64 {
        self.strength
    }

    public fun sword_created(self: &Forge): u64 {
        self.sword_created
    }
    // what is entry function??
    public entry fun sword_create(forge: &mut Forge, magic: u64, strength: u64, recipient: address, ctx: &mut TxContext) {
        use sui::transfer;
        let sword = Sword {
            id: object::new(ctx),
            magic: magic,
            strength: strength,
        };
        transfer::transfer(sword, recipient);
        forge.sword_created= forge.sword_created + 1;
    }

    public entry fun sword_transfer(sword: Sword, recipient: address, _ctx: &mut TxContext) {
        use sui::transfer;
        transfer::transfer(sword, recipient);
    }
    // Check drop ability
    
    #[test]
    public fun test_module_init() {
        use sui::test_scenario;
        let admin = @0xBABE;

        let scenario_emul = test_scenario::begin(admin);
        let scenario = &mut scenario_emul;

        {
            init(test_scenario::ctx(scenario));
        };

        test_scenario::next_tx(scenario, admin);
        {
            let forge = test_scenario::take_from_sender<Forge>(scenario);
            assert!(sword_created(&forge) == 0, 1);
            test_scenario::return_to_sender(scenario, forge);
        };

        test_scenario::end(scenario_emul);
    }

    #[test]
    fun test_sword_create() {
        use sui::transfer;
        use sui::tx_context;
        // Create a dummy TxContext for testing
        let ctx = tx_context::dummy();

        // Create a sword
        let sword = Sword {
            id: object::new(&mut ctx),
            magic: 42,
            strength: 7,
        };

        // Check if accessor functions return correct values
        assert!(magic(&sword) == 42 && strength(&sword) == 7, 1);
        // dummy address has to be CAFESOMETHING??
        // Nope it should be Hexadecimal.

        let dummy_addr = @0xBB;

        transfer::transfer(sword, dummy_addr);
    }

    #[test]
    fun test_sword_transactions() {
        use sui::test_scenario;

        let admin = @0xBABE;
        let initial_owner = @0xCAFEBABE;
        let final_owner = @0xDEADBEEF;

        //Start to emulate the transaction
        let scenario_emul = test_scenario::begin(admin);
        let scenario = &mut scenario_emul;

        {
            init(test_scenario::ctx(scenario));
        };
        test_scenario::next_tx(scenario, admin);
        {
            let forge = test_scenario::take_from_sender<Forge>(scenario);
            sword_create(&mut forge, 234,5,initial_owner, test_scenario::ctx(scenario));
            test_scenario::return_to_sender(scenario, forge)
        };
        test_scenario::next_tx(scenario, initial_owner);
        {
            let sword = test_scenario::take_from_sender<Sword>(scenario);
            sword_transfer(sword, final_owner, test_scenario::ctx(scenario));
        };
        test_scenario::next_tx(scenario, final_owner);
        {
            let sword = test_scenario::take_from_sender<Sword>(scenario);
            assert!(magic(&sword) == 234 && strength(&sword) == 5, 1);
            test_scenario::return_to_sender(scenario, sword);
        };

        test_scenario::end(scenario_emul);
        

    }
 }

