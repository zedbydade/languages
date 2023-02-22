fn main() {
    #[derive(Clone)]
    struct DoublyLinkedNode {
        data: u64, 
        next: Option<Box<DoublyLinkedNode>>, 
        prev: Option<Box<DoublyLinkedNode>> 
    }

    impl DoublyLinkedNode {
    }

    struct DoublyLinkedList {
        length: u64, 
        tail: DoublyLinkedNode, 
        head: DoublyLinkedNode
    }

    impl DoublyLinkedList {
        pub fn push_front(&mut self, data: u64, prev: Option<Box<DoublyLinkedNode>>) {
            let is_empty = self.is_empty();
            let mut new_node = DoublyLinkedNode {
                data, 
                prev,
                next: None,
            };
            if is_empty {
                self.length = 1;
                self.tail = new_node.clone(); 
                self.head = new_node.clone();
            } else {
                new_node.next = Some(Box::new(self.head.clone()));
                self.head.prev = Some(Box::new(new_node.clone()));
                self.tail = new_node.clone(); 
                self.length = 2;
            }

        }
        pub fn push_back(&mut self, data: u64) {
            let is_empty = self.is_empty();
            let mut new_node = DoublyLinkedNode {
                data, 
                prev: None,
                next: None,
            };
            if is_empty {
                self.length = 1;
                self.tail = new_node.clone(); 
                self.head = new_node.clone();
            } else {
                new_node.prev = Some(Box::new(self.tail.clone()));
                self.tail.next = Some(Box::new(new_node.clone()));
                self.tail = new_node.clone(); 
                self.length = 2;
            }
        }

        pub fn len(&self) -> u64 {
            self.length
        }

        pub fn is_empty(&self) -> bool {
            true
        }
    }
}
